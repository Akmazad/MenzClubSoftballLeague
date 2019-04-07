############### Score table constraints ###############

ALTER TABLE [dbo].[menzclubsoftball_tblScore]  WITH CHECK ADD  CONSTRAINT [menzclubsoftball_tblscore_teamid_fk1] FOREIGN KEY([teamid])
REFERENCES [dbo].[menzclubsoftball_tblTeam] ([id])
GO
ALTER TABLE [dbo].[menzclubsoftball_tblScore] CHECK CONSTRAINT [menzclubsoftball_tblscore_teamid_fk1]

############### Standing table constraints ###############

ALTER TABLE [dbo].[menzclubsoftball_tblStanding]  WITH CHECK ADD  CONSTRAINT [menzclubsoftball_tblstanding_teamid_fk1] FOREIGN KEY([teamid])
REFERENCES [dbo].[menzclubsoftball_tblTeam] ([id])
GO
ALTER TABLE [dbo].[menzclubsoftball_tblStanding] CHECK CONSTRAINT [menzclubsoftball_tblstanding_teamid_fk1]

############### Schedule table constraints ###############

ALTER TABLE [dbo].[menzclubsoftball_tblSchedule]  WITH CHECK ADD  CONSTRAINT [menzclubsoftball_tblschedule_teamid_fk1] FOREIGN KEY([teamid])
REFERENCES [dbo].[menzclubsoftball_tblTeam] ([id])
GO
ALTER TABLE [dbo].[menzclubsoftball_tblSchedule] CHECK CONSTRAINT [menzclubsoftball_tblschedule_teamid_fk1]