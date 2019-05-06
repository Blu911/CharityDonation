package pl.blu911.oddam.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Data
@Entity
@Table(name = "users")
@ToString(exclude = {"addresses", "donations", "roles"})
public class User {

    @Column(name = "enabled")
    private boolean enabled;

    @NotBlank
    @Email
    @Column(nullable = false, unique = true)
    private String email;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Column(nullable = false, unique = true)
    private String username;
    @NotBlank
    private String password;

    public User() {
        super();
        this.enabled = false;
    }

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "users_role", joinColumns = @JoinColumn(name = "users_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;
    private int phoneNumber;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.PERSIST)
    private List<Address> addresses;
    @OneToMany
    private List<Donation> donations;
    //USER fields
    private String userFirstName;
    private String userLastName;

    //INSTITUTION fields
    private String institutionName;
    private String institutionGoalAndMission;
    @ManyToOne
    private Category institutionType;
    @ManyToMany
    @JoinTable(name = "institutions_helps_who", joinColumns = @JoinColumn(name = "users_id"),
            inverseJoinColumns = @JoinColumn(name = "categories_id"))
    private List<Category> institutionHelpsWho;
    @ManyToMany
    @JoinTable(name = "institutions_needs_what", joinColumns = @JoinColumn(name = "users_id"),
            inverseJoinColumns = @JoinColumn(name = "categories_id"))
    private List<Category> institutionNeedsWhat;

    private LocalDateTime created;
    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }

}
