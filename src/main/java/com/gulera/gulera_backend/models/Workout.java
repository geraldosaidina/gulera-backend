package com.gulera.gulera_backend.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Data
@Table(name = "tb_workout")
public class Workout {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    @Column(nullable = false)
    private String title;

    private String description;

    private LocalDateTime workout_date;

    @OneToMany(mappedBy = "workout")
    private List<Exercise> exercises;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
