Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF16A8FD4
	for <lists+samba-technical@lfdr.de>; Fri,  3 Mar 2023 04:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=z4ZQBQHYRxUh3Uyk5Yoppec/trQ1ATB6tUe21Lt5fTQ=; b=Raoz8uemf2B6/S8UJSidjL3WI0
	G2r2lQfM6fVXjMBhy+X0cc+zvFEK671ozGKVHh1pW2Ik2DhgA6lL/z+Gjfsjmh6K3n2rFvysPrIvl
	eeChSFfLHnhCIzYg+jwatzWOUgSsp9NqmYjtf0kItTZKC2MSD0nfUviwVgpWR1LOcIGZ1F+nxRBf+
	ugrn86H2jNmyybPgsc5CzLNJ0Xz+k1zYUPKbv3dVQTKosJ3h2iqeNsWBWJj9C+QoyIjkndkVJSYkv
	yZdmtw2NL/A/Rur0FKpcCQT1X7EvQ3aIPi/RrkmXoU5Gb1lPRe/WsEQztD72DUz6XJYyTl1YPhwga
	ryKvuRjg==;
Received: from ip6-localhost ([::1]:50786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXvyJ-00GyjD-J0; Fri, 03 Mar 2023 03:20:39 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:41599) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXvyB-00GyiG-Lx; Fri, 03 Mar 2023 03:20:34 +0000
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-17671fb717cso132710fac.8; 
 Thu, 02 Mar 2023 19:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677813626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4ZQBQHYRxUh3Uyk5Yoppec/trQ1ATB6tUe21Lt5fTQ=;
 b=peA/eztjmQDm+vhClDsW0HcmCd3MQXKPI62YRQjqV73teToaKvKcAbnZjIUwBEILZR
 Rq1irykylU363zSH26094cQ8cY+EUDCANEkWGZfjaPKC84wjKUJkLhbYsetv0i7Yawoh
 LliwPf+aAQHi/C2q0uirOZfRP0WZnJXBe9wiTldGAczf9ulHBcdVbKdNr/bB4yFxkKj9
 E4FFoHZlTtecQDmz3iboTCvZWpQ/JfkvFymG6ZESI8mreXgyRneg/1V625HKddhpRtSh
 FIrhoKUBlmQZuTaSxSIrbY/g5CSHDZglErnqJuGMoFEO/XFU6ySv7SXzP+cp4+c5FPsk
 XoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677813626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4ZQBQHYRxUh3Uyk5Yoppec/trQ1ATB6tUe21Lt5fTQ=;
 b=cucyQ1e+drwatALxDKGMzg45JyTZBpRtbNiM07Phludq0aY2exjriPl8dE53HANyl0
 jDu1XTKONlaIovhf6ul6V0VviR2Wukx0vl2rfNYcADIzFL03cD8XH+odUQ8rA7bd7owb
 EweWAPqVqUjvrZ7bpelXHkRi5EaTvAS1/h90s+qd76C/ujKoOkNW1ooPScjHs7P/VgGC
 A3YSQnl3C0TgfOWIh4YTPoNWf369QXUegM3m/J77fM2s8Gbd3Db8wiYTpqh4nsbuhLah
 1UMCRvgX+G5THh+NDIsSIR2cgzlcaRofHjW6VIyDpE6EdPbaO36ctCOL9wOlv4gq+Hsw
 aP2A==
X-Gm-Message-State: AO0yUKVJyAvvJDoq81AHHJLQ9sx5oQ2uJGUItKmpr7IjS1Env3Bppa9l
 NyWNbgZLRUnW2MxJ/1GoFlPnXDxhE2T6CU8FcrI=
X-Google-Smtp-Source: AK7set/j6lf5svhXia8gg5JjWctNKe/INstUfYjOh7nmyrOd6UzaSN1WWUfXftX+JI7EcS+qCh/vQICNcpcxFVld9bg=
X-Received: by 2002:a05:6870:98af:b0:176:2b10:5f9f with SMTP id
 eg47-20020a05687098af00b001762b105f9fmr119025oab.7.1677813626204; Thu, 02 Mar
 2023 19:20:26 -0800 (PST)
MIME-Version: 1.0
References: <8edef4b7-548d-997c-e13a-8a1dcb903631@samba.org>
In-Reply-To: <8edef4b7-548d-997c-e13a-8a1dcb903631@samba.org>
Date: Thu, 2 Mar 2023 22:20:14 -0500
Message-ID: <CAOCN9ryNweQ-NPrmF-T6W5Vr-9no7Liaoxx-AHppY3fUD2zxPQ@mail.gmail.com>
Subject: Re: [Samba] [Announce] Samba 4.18.0rc4 Available for Download
To: Jule Anger <janger@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: samba@lists.samba.org, samba-announce@lists.samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Mar 1, 2023 at 8:02=E2=80=AFAM Jule Anger via samba
<samba@lists.samba.org> wrote:
>
> Release Announcements
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This is the fourth release candidate of Samba 4.18.  This is *not*
> intended for production environments and is designed for testing
> purposes only.  Please report any defects via the Samba bug reporting
> system at https://bugzilla.samba.org/.
>
> Samba 4.18 will be the next version of the Samba suite.

I've updated my RPM building tools at
https://github.com/nkadel/ansiblerepo. Enjoy?

Nico Kadel-Garcia


> UPGRADING
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> NEW FEATURES/CHANGES
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> SMB Server performance improvements
> -----------------------------------
>
> The security improvements in recent releases
> (4.13, 4.14, 4.15, 4.16), mainly as protection against symlink races,
> caused performance regressions for metadata heavy workloads.
>
> While 4.17 already improved the situation quite a lot,
> with 4.18 the locking overhead for contended path based operations
> is reduced by an additional factor of ~ 3 compared to 4.17.
> It means the throughput of open/close
> operations reached the level of 4.12 again.
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
> For some time a few samba-tool commands have had a --color=3Dyes|no|auto
> option, which determines whether the command outputs ANSI colour
> codes. Now all samba-tool commands support this option, which now also
> accepts 'always' and 'force' for 'yes', 'never' and 'none' for 'no',
> and 'tty' and 'if-tty' for 'auto' (this more closely matches
> convention). With --color=3Dauto, or when --color is omitted, colour
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
> New samba-tool dsacl subcommand for deleting ACES
> -------------------------------------------------
>
> The samba-tool dsacl tool can now delete entries in directory access
> control lists. The interface for 'samba-tool dsacl delete' is similar
> to that of 'samba-tool dsacl set', with the difference being that the
> ACEs described by the --sddl argument are deleted rather than added.
>
> No colour with NO_COLOR environment variable
> --------------------------------------------
>
> With both samba-tool --color=3Dauto (see above) and some other places
> where we use ANSI colour codes, the NO_COLOR environment variable will
> disable colour output. See https://no-color.org/ for a description of
> this variable. `samba-tool --color=3Dalways` will use colour regardless
> of NO_COLOR.
>
> New wbinfo option --change-secret-at
> ------------------------------------
>
> The wbinfo command has a new option, --change-secret-at=3D<DOMAIN CONTROL=
LER>
> which forces the trust account password to be changed at a specified doma=
in
> controller. If the specified domain controller cannot be contacted the
> password change fails rather than trying other DCs.
>
> New option to change the NT ACL default location
> ------------------------------------------------
>
> Usually the NT ACLs are stored in the security.NTACL extended
> attribute (xattr) of files and directories. The new
> "acl_xattr:security_acl_name" option allows to redefine the default
> location. The default "security.NTACL" is a protected location, which
> means the content of the security.NTACL attribute is not accessible
> from normal users outside of Samba. When this option is set to use a
> user-defined value, e.g. user.NTACL then any user can potentially
> access and overwrite this information. The module prevents access to
> this xattr over SMB, but the xattr may still be accessed by other
> means (eg local access, SSH, NFS). This option must only be used when
> this consequence is clearly understood and when specific precautions
> are taken to avoid compromising the ACL content.
>
> Azure Active Directory / Office365 synchronisation improvements
> --------------------------------------------------------------
>
> Use of the Azure AD Connect cloud sync tool is now supported for
> password hash synchronisation, allowing Samba AD Domains to synchronise
> passwords with this popular cloud environment.
>
> REMOVED FEATURES
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> smb.conf changes
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>    Parameter Name                          Description     Default
>    --------------                          -----------     -------
>    acl_xattr:security_acl_name             New security.NTACL
>    server addresses                        New
>
>
> CHANGES SINCE 4.18.0rc3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> o  Andreas Schneider <asn@samba.org>
>     * BUG 15308: Avoid that tests fail because other tests didn't do
> cleanup on
>       failure.
>
> o  baixiangcpp <baixiangcpp@gmail.com>
>     * BUG 15311: fd_load() function implicitly closes the fd where it
> should not.
>
>
> CHANGES SINCE 4.18.0rc2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> o  Jeremy Allison <jra@samba.org>
>     * BUG 15301: Improve file_modtime() and issues around smb3 unix test.
>
> o  Ralph Boehme <slow@samba.org>
>     * BUG 15299: Spotlight doesn't work with latest macOS Ventura.
>
> o  Stefan Metzmacher <metze@samba.org>
>     * BUG 15298: Build failure on solaris with tevent 0.14.0 (and ldb
> 2.7.0).
>       (tevent 0.14.1 and ldb 2.7.1 are already released...)
>
> o  John Mulligan <jmulligan@redhat.com>
>     * BUG 15307: vfs_ceph incorrectly uses fsp_get_io_fd() instead of
>       fsp_get_pathref_fd() in close and fstat.
>
> o  Andreas Schneider <asn@samba.org>
>     * BUG 15291: test_chdir_cache.sh doesn't work with
> SMBD_DONT_LOG_STDOUT=3D1.
>     * BUG 15301: Improve file_modtime() and issues around smb3 unix test.
>
>
> CHANGES SINCE 4.18.0rc1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> o  Andrew Bartlett <abartlet@samba.org>
>     * BUG 10635: Office365 azure Password Sync not working.
>
> o  Stefan Metzmacher <metze@samba.org>
>     * BUG 15286: auth3_generate_session_info_pac leaks wbcAuthUserInfo.
>
> o  Noel Power <noel.power@suse.com>
>     * BUG 15293: With clustering enabled samba-bgqd can core dump due to =
use
>       after free.
>
>
> KNOWN ISSUES
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18#Release_=
blocking_bugs
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D Our Code, Our Bugs, Our Responsibility.
> =3D=3D The Samba Team
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Download Details
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The uncompressed tarballs and patch files have been signed
> using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
> from:
>
>          https://download.samba.org/pub/samba/rc/
>
> The release notes are available online at:
>
> https://download.samba.org/pub/samba/rc/samba-4.18.0rc4.WHATSNEW.txt
>
> Our Code, Our Bugs, Our Responsibility.
> (https://bugzilla.samba.org/)
>
>                          --Enjoy
>                          The Samba Team
>
> --
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba

