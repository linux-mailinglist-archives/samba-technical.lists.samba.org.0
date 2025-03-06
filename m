Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72FA5465A
	for <lists+samba-technical@lfdr.de>; Thu,  6 Mar 2025 10:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=K1I7oj/krDaIbUY/1/D6VYfmnkiXUCBusPUQLGtKGiY=; b=qSUjhIKKhuQzxyc4ldS30j+6e1
	0gC5Ik/8XQcbZ4NYby+QQKBCTW2GX6YMvPEfgkTs5Edw+HBOyKckRXOhjQdJy3fbAYc/1YiudHxn+
	awsSBEJEyXz7JcGo2LCo4RsdDtt38/SAPf5nBE8YVM4kjXw9OuavDuqRAnZ3ix8D4mqtSBD+L3S2K
	aZqsW5bqKW8Qa7uw6C3k4KVmwWdD0HGpJ8oL6jzAUDN5qTk0md/ipDfL71ifnEbxd4+XHcwGcy5Mr
	mw51AA9uJBuxbqQ7brFRjZTKcvtp8+FnFdWiVjPFZVutCBwLSSDxXsoW8p8PApaAusNnwE+LRgUix
	kZ20UT7Q==;
Received: from ip6-localhost ([::1]:59874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tq7YU-00Fe3J-MW; Thu, 06 Mar 2025 09:30:14 +0000
Received: from air.basealt.ru ([193.43.8.18]:42332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tq7YM-00Fe3C-3T
 for samba-technical@lists.samba.org; Thu, 06 Mar 2025 09:30:08 +0000
Received: from kip-nb.smb.basealt.ru (unknown [178.69.201.215])
 (Authenticated sender: korytovip)
 by air.basealt.ru (Postfix) with ESMTPSA id 77F3123392
 for <samba-technical@lists.samba.org>; Thu,  6 Mar 2025 12:14:30 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=basealt.ru; s=dkim;
 t=1741252470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K1I7oj/krDaIbUY/1/D6VYfmnkiXUCBusPUQLGtKGiY=;
 b=mpTf2uxQgzmM1lmWNXAW1vwHB5irMRq5jK+w4yHsq24K94+LFeqAO8ZQfeIpEGkgCZ9B34
 00COW441xFgEG1TnMgQFMrRo7KsPEx7vZIVLgj1g+KRhuMc7jOlnn0QzhxBZ0lRvmZNZKi
 9ZcbBvvNxj9K96/aCwrL8M3ltFLO1jrH3/NTm+AR1SPCSV3Mj7tXI4EMOwlbtX025ZXodE
 vV+/lY0bqxA1JUV4HE00Ds70Ci8wwL8aMaWPco+OLEHrzERoRCscEu5r4vQRpPgys+AikL
 NuOQzgINN8H6PCDG/gbJ2yC+ADqPOgmwcUefjNq78hrXtTMD/TcOLXxmNomkeQ==
Message-ID: <5244db2120303ad890f362503240c359f5edcb3a.camel@basealt.ru>
Subject: Accessing shared folders in trusted domains
To: samba-technical <samba-technical@lists.samba.org>
Date: Thu, 06 Mar 2025 12:14:29 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-alt1 
MIME-Version: 1.0
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
From: Ivan Korytov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ivan Korytov <korytovip@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

There was a change in libmsmbclient that enabled default Kerberos
ccache in cli_session_creds_init when no password is supplied.

https://gitlab.com/samba-team/samba/-/commit/fb7e19826afab4fce33769eb7aef16=
a1c650b23a

Why we need a check that there is no fallback set? Why can't
libsmbclient always set ccache?

I'm mentioning this because there is a problem when accessing shared
folders in trusted domains with Kerberos.

It affects clients that use libsmbclient, like GIO/GVFS and KIO.

In GIO fallback is enabled when username is not empty (almost always)
and in KIO fallback is always enabled. If the fallback is set then
there is no way that libsmbclient will get the correct Kerberos
credentials.

Here is what I've found (when the fallback is set, so that ccache is
not configured):

When SMBC_server (SMBC_server_internal) is called following
authentication functions in order are used:

- SMBC_auth_credentials
    - cli_session_creds_init
- cli_session_setup_creds
    - cli_session_setup_gensec_send
        - auth_generic_client_prepare
            - cli_credentials_guess
            - auth_generic_set_creds

cli_session_setup_creds uses the same credentials variable as
SMBC_auth_credentials does.

Function auth_generic_client_prepare obtains correct credentials with
cli_credentials_guess (it is also used in libcli that used in all Samba
utilities, like smbclient).

But aferwards auth_generic_set_creds is called and it copies
credentials passed as an argument to auth_generic_client_prepare and
discards previously acquired credentials by cli_credentials_guess.

So, correct credentials are lost and credentials from
cli_session_creds_init are used, which can't be used to authenticate
with Kerberos.

Example of a correct request (not using libsmbclient):
$ KRB5_TRACE=3D/dev/stdout smbclient -k //dc1.trust.alt/sysvol
WARNING: The option -k|--kerberos is deprecated!
[5695] 1733747978.787075: Getting credentials Administrator@TRUST.ALT -
> cifs/dc1.trust.alt@TRUST.ALT using ccache
KEYRING:persistent:10002:10002

Example of a incorrect request:
$ KRB5_TRACE=3D/dev/stdout dolphin smb://dc1.trust.alt/sysvol
[5724] 1733748053.579586: Getting credentials Administrator@TRUST.ALT -
> cifs/dc1.trust.alt@TEST.ALT using ccache
KEYRING:persistent:10002:10002

Trust is a two-way, so everyone can access everything everywhere.
Computer is joined to TEST.ALT domain.

When I discovered this change in newer versions of Samba, I've disabled
the fallback check and creds returned from cli_session_creds_init are
correct and can be used to try Kerberos authentication, even when
fallback is set.

--=20
Ivan Korytov

korytovip@basealt.ru


