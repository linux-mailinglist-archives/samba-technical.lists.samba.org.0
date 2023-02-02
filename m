Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4D568764C
	for <lists+samba-technical@lfdr.de>; Thu,  2 Feb 2023 08:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=36aPh9iNaB5O1D4LzZyYX4FV0+Ju44Qe6ynfFGcJjFw=; b=0cOUcnYocYwoeksLYUK1z22yjx
	XqaEPxncCK+VnqBAgqjfGIiNtfGLTPvLvk1D4TbIhDFzsrOVt1iLpOXDPt20kwX2iYvCR7p705mQu
	alx0uuMbVdax4o+ejeLfGcu5UXBroqD8tCyowPpAEfF0vhWalakWcbIw1eKJN79q9aHNJ4tysiIIR
	MaNBmw1TUduu7SzzjmTrKJ4LvmPh+3ik0KH14218XdkSg71l0+jowd529ztRbPO7fKTIVCA7CpLXF
	Rv7JAobxjilSlNjvUPMyhjI1XNe7s0aJRiLzIwYJUDhqfjzubOu2HjMf6iR8sYePRW6FNf+ZczVjo
	ZMeDYTHg==;
Received: from ip6-localhost ([::1]:43992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pNTp1-007sYB-10; Thu, 02 Feb 2023 07:15:51 +0000
Received: from bauen-sie-mit.tropenklinik.de ([193.111.102.67]:41200
 helo=mail.tropenklinik.de) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pNToh-007sXx-NG; Thu, 02 Feb 2023 07:15:41 +0000
Received: from dommaster.tlk.loc (host.paul-lechler-krankenhaus.de
 [37.24.141.18])
 by v10132.bl.de.weber.cloud (Postfix) with ESMTPSA id A2D76E1DF3;
 Thu,  2 Feb 2023 08:03:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tropenklinik.de;
 s=default; t=1675321420;
 bh=36aPh9iNaB5O1D4LzZyYX4FV0+Ju44Qe6ynfFGcJjFw=;
 h=Received:From:To:Subject;
 b=PqA81G6I47s7mP/TIvwUiUWNrYPfuKVcw6otOaNy/V7DiMItiexgkj0kmZH0IP7yt
 TsTLTYfZRGLf/YvncKsDK0C3AWKyTKVBwz00uz6Dk3FSztb/TrlVxPV7AkDuAxSjox
 Ibny00xHry/EhFLAntHsmSfaJTn9N6iG3GpnOLHQ=
Authentication-Results: v10132.bl.de.weber.cloud;
 spf=pass (sender IP is 37.24.141.18) smtp.mailfrom=mueller@tropenklinik.de
 smtp.helo=dommaster.tlk.loc
Received: from [192.168.135.39] (port=59847 helo=edvabteilung2)
 by dommaster.tlk.loc with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mueller@tropenklinik.de>)
 id 1pNTdC-004MbN-Ch; Thu, 02 Feb 2023 08:03:39 +0100
To: "'Jule Anger'" <janger@samba.org>, <samba-announce@lists.samba.org>,
 <samba-technical@lists.samba.org>
References: <ea2b5b55-a217-5bfa-2abf-3d9c509e59ca@samba.org>
In-Reply-To: <ea2b5b55-a217-5bfa-2abf-3d9c509e59ca@samba.org>
Subject: AW: [Samba] [Announce] Samba 4.18.0rc2 Available for Download
Date: Thu, 2 Feb 2023 08:03:38 +0100
Message-ID: <002201d936d4$79735af0$6c5a10d0$@tlk.loc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Content-Language: de
Thread-Index: AQIfKI9f6E0d3TkDSd+RNdq37gIiNa4vUVGA
X-Antivirus: Avast (VPS 230131-14, 31.1.2023), Outbound message
X-Antivirus-Status: Clean
X-PPP-Message-ID: <167532141997.570699.17588641711247268843@v10132.bl.de.weber.cloud>
X-PPP-Vhost: tropenklinik.de
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?utf-8?q?Daniel_M=C3=BCller_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Daniel_M=C3=BCller?= <mueller@tropenklinik.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear all,

samba  is realy a good piece of software and I thanks to all the people =
who develop it.
But beside the new features what about a new gui to for administration? =
Since swat is gone there is no follow up.
My experience with ADUC running with Samba 4.17 domain in an windows =
10/11 environment showed me that it is no longer up to date
and has issues in an production environment.
Certanly I can do all the things from cli but I think it should be time =
to integrate Active Directory Administrative Center (ADWS).
I know Catalist was trying to build a prototype. Last year I downloaded =
the source and tried it out with no success. There was not enough
description of how to integrate it.

Greetings
Daniel

-----Urspr=C3=BCngliche Nachricht-----
Von: Jule Anger via samba [mailto:samba@lists.samba.org]=20
Gesendet: Mittwoch, 1. Februar 2023 18:50
An: samba-announce@lists.samba.org; samba@lists.samba.org; =
samba-technical@lists.samba.org
Betreff: [Samba] [Announce] Samba 4.18.0rc2 Available for Download

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the second release candidate of Samba 4.18.  This is *not* =
intended for production environments and is designed for testing =
purposes only.  Please report any defects via the Samba bug reporting =
system at https://bugzilla.samba.org/.

Samba 4.18 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

More succinct samba-tool error messages
---------------------------------------

Historically samba-tool has reported user error or misconfiguration by =
means of a Python traceback, showing you where in its code it noticed =
something was wrong, but not always exactly what is amiss. Now it tries =
harder to identify the true cause and restrict its output to describing =
that. Particular cases include:

  * a username or password is incorrect
  * an ldb database filename is wrong (including in smb.conf)
  * samba-tool dns: various zones or records do not exist
  * samba-tool ntacl: certain files are missing
  * the network seems to be down
  * bad --realm or --debug arguments

Accessing the old samba-tool messages
-------------------------------------

This is not new, but users are reminded they can get the full Python =
stack trace, along with other noise, by using the argument '-d3'.
This may be useful when searching the web.

The intention is that when samba-tool encounters an unrecognised problem =
(especially a bug), it will still output a Python traceback.
If you encounter a problem that has been incorrectly identified by =
samba-tool, please report it on https://bugzilla.samba.org.

Colour output with samba-tool --color
-------------------------------------

For some time a few samba-tool commands have had a --color=3Dyes|no|auto =
option, which determines whether the command outputs ANSI colour codes. =
Now all samba-tool commands support this option, which now also accepts =
'always' and 'force' for 'yes', 'never' and 'none' for 'no', and 'tty' =
and 'if-tty' for 'auto' (this more closely matches convention). With =
--color=3Dauto, or when --color is omitted, colour codes are only used =
when output is directed to a terminal.

Most commands have very little colour in any case. For those that =
already used it, the defaults have changed slightly.

  * samba-tool drs showrepl: default is now 'auto', not 'no'

  * samba-tool visualize: the interactions between --color-scheme,
    --color, and --output have changed slightly. When --color-scheme is
    set it overrides --color for the purpose of the output diagram, but
    not for other output like error messages.

New samba-tool dsacl subcommand for deleting ACES
-------------------------------------------------

The samba-tool dsacl tool can now delete entries in directory access =
control lists. The interface for 'samba-tool dsacl delete' is similar to =
that of 'samba-tool dsacl set', with the difference being that the ACEs =
described by the --sddl argument are deleted rather than added.

No colour with NO_COLOR environment variable
--------------------------------------------

With both samba-tool --color=3Dauto (see above) and some other places =
where we use ANSI colour codes, the NO_COLOR environment variable will =
disable colour output. See https://no-color.org/ for a description of =
this variable. `samba-tool --color=3Dalways` will use colour regardless =
of NO_COLOR.

New wbinfo option --change-secret-at
------------------------------------

The wbinfo command has a new option, --change-secret-at=3D<DOMAIN =
CONTROLLER> which forces the trust account password to be changed at a =
specified domain controller. If the specified domain controller cannot =
be contacted the password change fails rather than trying other DCs.

New option to change the NT ACL default location
------------------------------------------------

Usually the NT ACLs are stored in the security.NTACL extended attribute =
(xattr) of files and directories. The new "acl_xattr:security_acl_name" =
option allows to redefine the default location. The default =
"security.NTACL" is a protected location, which means the content of the =
security.NTACL attribute is not accessible from normal users outside of =
Samba. When this option is set to use a user-defined value, e.g. =
user.NTACL then any user can potentially access and overwrite this =
information. The module prevents access to this xattr over SMB, but the =
xattr may still be accessed by other means (eg local access, SSH, NFS). =
This option must only be used when this consequence is clearly =
understood and when specific precautions are taken to avoid compromising =
the ACL content.

Azure Active Directory / Office365 synchronisation improvements
--------------------------------------------------------------

Use of the Azure AD Connect cloud sync tool is now supported for =
password hash synchronisation, allowing Samba AD Domains to synchronise =
passwords with this popular cloud environment.

REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   acl_xattr:security_acl_name             New security.NTACL


CHANGES SINCE 4.18.0rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 10635: Office365 azure Password Sync not working.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15286: auth3_generate_session_info_pac leaks wbcAuthUserInfo.

o  Noel Power <noel.power@suse.com>
    * BUG 15293: With clustering enabled samba-bgqd can core dump due to =
use
      after free.


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18#Release_=
blocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by =
joining the #samba-technical:matrix.org matrix room, or #samba-technical =
IRC channel on irc.libera.chat

If you do report problems then please try to send high quality feedback. =
If you don't provide vital information to help us track down the problem =
then you will probably be ignored.  All bug reports should be filed =
under the Samba 4.1 and newer product in the project's Bugzilla database =
(https://bugzilla.samba.org/).


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D Our Code, Our Bugs, Our Responsibility.
=3D=3D The Samba Team
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Download Details
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The uncompressed tarballs and patch files have been signed using GnuPG =
(ID AA99442FB680B620).  The source code can be downloaded
from:

         https://download.samba.org/pub/samba/rc/

The release notes are available online at:

https://download.samba.org/pub/samba/rc/samba-4.18.0rc2.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

--
To unsubscribe from this list go to the following URL and read the
instructions:  https://lists.samba.org/mailman/options/samba


