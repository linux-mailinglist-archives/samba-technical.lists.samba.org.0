Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C267430A
	for <lists+samba-technical@lfdr.de>; Thu, 19 Jan 2023 20:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=e1iANQcHiHC/rklBYtpf5v8pRppsN2jvt4YaztsqvAs=; b=4jcd5awcBCYanIrctw3Kc3/VoP
	Bo7LqcTREgNr/p1XE7KENzwHQj8Qz0/fQF7FqaVnOsXPcqxCRfZY94Xiyz/1WDyll6rqRYfkyGAvh
	/nG1oXgWhdEZB92zDq3O4tpzSF0FPO4bmL2Kj+YQcsPnAAAesL6aPFRBuu6F8/u9cUVR5pg81H1yq
	THZL6lxsaW29bzEoIJrXz5tYoYGrG/vNc0kDegFtCCBeJ/y5ou/vQw4mLh7I7G+cJ4BTo1pBNWpg6
	vtM16FHNFfJZB/paEnzNFYXLUN0pJMKpXwLwVfqGLduiW+Q1zKFsN+WI5jBdpkLd5TsbvUn2G8dtY
	Nt+tbtbw==;
Received: from ip6-localhost ([::1]:52844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIaos-000vBO-VG; Thu, 19 Jan 2023 19:43:31 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:35577) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIaok-000vBA-KD; Thu, 19 Jan 2023 19:43:27 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 m18-20020a05683026d200b0068661404380so1827293otu.2; 
 Thu, 19 Jan 2023 11:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e1iANQcHiHC/rklBYtpf5v8pRppsN2jvt4YaztsqvAs=;
 b=nl1tnEXwwRVZ09jkOXOYZJNZTtVCJhfhfLZKrvijOVqhP3yIJQmIHXVGhYVNhbXGxw
 C7pkujnyNCii2159acqbDIoplxmuqQQX+T35mzUztrfwK9i8YwympUMozOlC9Cu0th93
 HIKYs4fULT0jNJcpVNzADPjghsK/YH2Vd+AQWilJlA6MG4fxaoGzsuBwb5rMONHW+0fc
 MaSFJ6ybkmw6Z9DEIbAFSnIE1dyVZks4jq4n35dyo/DAIgaZNYCbhRDXwagzLEn5eFMw
 pjNrxxkUdWnax1J2u/JdLC2NYbkrCzilMoho/ZaY7qgq2sXI8HiPDEsvmlvhprNGkjeW
 ojXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1iANQcHiHC/rklBYtpf5v8pRppsN2jvt4YaztsqvAs=;
 b=QdTGlJLqnQMPsGhHBXq9BWTbxeTY0TygtAS1agoAUe9kebm+bQBA4X9qQLIIL4yXVp
 LO2I1WERHnaeCKj8a4jV6AGOvld9NvsybWLD6jHn64ia7Y5MCVEeE+WG8zmwVx91VI6O
 23Ohu0r8pKfB20vJCI96kwIDSLxhSO1bMDVjFsaCDFSRuFAdbSBiBMe4UZVB4DCEjMUk
 BvHirsc5hN1o7PQ26n9ZJiEXYFcrRnXBjlvsw2/d3SzHc90GXNubVkhpvcKJoNVj6pwJ
 NmIY1LWOzzwoKhpDstPTl8oWqtAJEILLOhdTbpKf1Fdo71V2Bclganl98sYa/LYFuqKl
 DMmw==
X-Gm-Message-State: AFqh2kop/DfrOLxqQsnVLiB3oDjCA7rPzu5aMd5W7bPoCVHmJ86r7Coc
 KGLRG87ElLCSQnb4UMWwZ3lQ8/ubv0wruT1nX1DlBEc0
X-Google-Smtp-Source: AMrXdXsI3zO1O9TBcScao98XUsak+lLWJfxUV3iwxRWAuUMrl4DGpcuNQkozc4Z0zqEZr6CF/4ubrUf3y/ny+O+F2n8=
X-Received: by 2002:a9d:80e:0:b0:686:44a7:1ac4 with SMTP id
 14-20020a9d080e000000b0068644a71ac4mr661891oty.151.1674157400245; Thu, 19 Jan
 2023 11:43:20 -0800 (PST)
MIME-Version: 1.0
References: <1f018166-c9d0-cacf-844c-f65cd3582846@samba.org>
In-Reply-To: <1f018166-c9d0-cacf-844c-f65cd3582846@samba.org>
Date: Thu, 19 Jan 2023 14:43:09 -0500
Message-ID: <CAOCN9rzCiLODkVaK-LYhp-F3pogBLUNwxWt8QwsPW3kU2uNZKQ@mail.gmail.com>
Subject: Re: [Announce] Samba 4.18.0rc1 Available for Download
To: Jule Anger <janger@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-announce@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It looks talloc, ldb, talloc, tdb, and tevent also got updated.

Don't expect any of them to be compatible with RHEL until sssd can
also be compiled with them updated, due to the .soname changes. It's
possible to publish Samba with internal libraries, as well as with
Heimdal, to avoid the dependency difficulties.

Nico Kadel-Garcia

On Wed, Jan 18, 2023 at 1:03 PM Jule Anger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Release Announcements
> =====================
>
> This is the first release candidate of Samba 4.18.  This is *not*
> intended for production environments and is designed for testing
> purposes only.  Please report any defects via the Samba bug reporting
> system at https://bugzilla.samba.org/.
>
> Samba 4.18 will be the next version of the Samba suite.
>
>
> UPGRADING
> =========
>
>
> NEW FEATURES/CHANGES
> ====================
>
> More succinct samba-tool error messages
> ---------------------------------------
>
> Historically samba-tool has reported user error or misconfiguration by
> means of a Python traceback, showing you where in its code it noticed
> something was wrong, but not always exactly what is amiss. Now it
> tries harder to identify the true cause and restrict its output to
> describing that. Particular cases include:
>
>   * a username or password is incorrect
>   * an ldb database filename is wrong (including in smb.conf)
>   * samba-tool dns: various zones or records do not exist
>   * samba-tool ntacl: certain files are missing
>   * the network seems to be down
>   * bad --realm or --debug arguments
>
> Accessing the old samba-tool messages
> -------------------------------------
>
> This is not new, but users are reminded they can get the full Python
> stack trace, along with other noise, by using the argument '-d3'.
> This may be useful when searching the web.
>
> The intention is that when samba-tool encounters an unrecognised
> problem (especially a bug), it will still output a Python traceback.
> If you encounter a problem that has been incorrectly identified by
> samba-tool, please report it on https://bugzilla.samba.org.
>
> Colour output with samba-tool --color
> -------------------------------------
>
> For some time a few samba-tool commands have had a --color=yes|no|auto
> option, which determines whether the command outputs ANSI colour
> codes. Now all samba-tool commands support this option, which now also
> accepts 'always' and 'force' for 'yes', 'never' and 'none' for 'no',
> and 'tty' and 'if-tty' for 'auto' (this more closely matches
> convention). With --color=auto, or when --color is omitted, colour
> codes are only used when output is directed to a terminal.
>
> Most commands have very little colour in any case. For those that
> already used it, the defaults have changed slightly.
>
>   * samba-tool drs showrepl: default is now 'auto', not 'no'
>
>   * samba-tool visualize: the interactions between --color-scheme,
>     --color, and --output have changed slightly. When --color-scheme is
>     set it overrides --color for the purpose of the output diagram, but
>     not for other output like error messages.
>
> No colour with NO_COLOR environment variable
> --------------------------------------------
>
> With both samba-tool --color=auto (see above) and some other places
> where we use ANSI colour codes, the NO_COLOR environment variable will
> disable colour output. See https://no-color.org/ for a description of
> this variable. `samba-tool --color=always` will use colour regardless
> of NO_COLOR.
>
> New wbinfo option --change-secret-at
> ------------------------------------
>
> The wbinfo command has a new option, --change-secret-at=<DOMAIN CONTROLLER>
> which forces the trust account password to be changed at a specified domain
> controller. If the specified domain controller cannot be contacted the
> password change fails rather than trying other DCs.
>
>
> REMOVED FEATURES
> ================
>
>
> smb.conf changes
> ================
>
>    Parameter Name                          Description     Default
>    --------------                          -----------     -------
>
>
> KNOWN ISSUES
> ============
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18#Release_blocking_bugs
>
>
> #######################################
> Reporting bugs & Development Discussion
> #######################################
>
> Please discuss this release on the samba-technical mailing list or by
> joining the #samba-technical:matrix.org matrix room, or
> #samba-technical IRC channel on irc.libera.chat
>
> If you do report problems then please try to send high quality
> feedback. If you don't provide vital information to help us track down
> the problem then you will probably be ignored.  All bug reports should
> be filed under the Samba 4.1 and newer product in the project's Bugzilla
> database (https://bugzilla.samba.org/).
>
>
> ======================================================================
> == Our Code, Our Bugs, Our Responsibility.
> == The Samba Team
> ======================================================================
>
>
> ================
> Download Details
> ================
>
> The uncompressed tarballs and patch files have been signed
> using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
> from:
>
>          https://download.samba.org/pub/samba/rc/
>
> The release notes are available online at:
>
> https://download.samba.org/pub/samba/rc/samba-4.18.0rc1.WHATSNEW.txt
>
> Our Code, Our Bugs, Our Responsibility.
> (https://bugzilla.samba.org/)
>
>                          --Enjoy
>                          The Samba Team
>

