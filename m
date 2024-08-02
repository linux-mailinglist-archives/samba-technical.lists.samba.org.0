Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56A945DB6
	for <lists+samba-technical@lfdr.de>; Fri,  2 Aug 2024 14:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XcYFOIc1pTP5QRTX2kn79WLWJ6xmRKl+sYjNZtCwhWc=; b=aRijcowdd9UxghXP1H02IPvmEk
	swGuRddqWVcyESe0gRBagY+bnpL9aWJnhGENtG3524C3MVS/Hhlz69/takfevYzdRzPF+QEHJ6NdM
	znhp5Gn8jcaLnRRJ66s1YLWsaH7UOkPDlrrdcogX8PCWLz2jpszQULfMPOfoaT1VbyoP3+wIpxAGP
	xBrX6wka0cmTxsttqibIWZht8uN33y9u4AOF4X/qK+EDq743zX+Azt6ip0cANzmEP1+gUtRvROQ0/
	tMqtfzssmhDjH+jxsXldKT+OueUsmSO4F7ptwQVoC6H1y9EXqm4bp2JoVuedNdvz9/lOq7uXh3cug
	Bib3ySdg==;
Received: from ip6-localhost ([::1]:19568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sZr8J-003pcg-8C; Fri, 02 Aug 2024 12:11:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12280) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sZr85-003pc0-Ij; Fri, 02 Aug 2024 12:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=XcYFOIc1pTP5QRTX2kn79WLWJ6xmRKl+sYjNZtCwhWc=; b=uMkA6ovi8cBA/vdYrapclC4iFD
 mZEMecQAEXUhfeKLPJpGvddlNgbSWkjxfU6Nj8TWLqqpmtitfGfx5LsourIPEaaYA011X3tWWhF/8
 WDIBh+MWgcEnQd/BNkQmltRKHmCqt1LpRLR/FGxM8ntqDlNJskoq2hiI+GXenrcHRerovYqlY5Cvw
 o2GJJ2OlWbSAa+EBKcAG9SKNnvC7aBu8lc1vHXcpmyrCR1o609EtNBSeQWwn5EuFtCcS5oXe6zeuu
 4KoJo85Rjic4vGKs53wdyblFwHnF2x2cG+VYmbw82gpo6Ik4nj2L7tJNmDIjJo/5dCONs2sTZop2s
 ai5Ubgq8QhA4hTrbFLF5xvaorwC2IiMfyaM9WV3nE6KUpwVyU7dBJz/OUMJXxVfP5NyWPCHAP6dZ5
 CqsOLGURmjW3CGJc0KV5RV9c8Byj7ope0X+q766bZyp+UoJUW6eqeaC42IdEZZnkIZitN42YTAh9V
 1Tz/B3IMWtHQoCqV4OSQSTg0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sZr84-004awV-2V; Fri, 02 Aug 2024 12:11:28 +0000
Date: Fri, 2 Aug 2024 14:11:22 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.3 Available for Download
Message-ID: <ZqzM6gDeAN0wPYTW@SERNOX19>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
---------------------

This is the latest stable release of the Samba 4.20 release series.

LDAP TLS/SASL channel binding support
-------------------------------------

The ldap server supports SASL binds with
kerberos or NTLMSSP over TLS connections
now (either ldaps or starttls).

Setups where 'ldap server require strong auth = allow_sasl_over_tls'
was required before, can now most likely move to the
default of 'ldap server require strong auth = yes'.

If SASL binds without correct tls channel bindings are required
'ldap server require strong auth = allow_sasl_without_tls_channel_bindings'
should be used now, as 'allow_sasl_over_tls' will generate a
warning in every start of 'samba', as well as '[samba-tool ]testparm'.

This is similar to LdapEnforceChannelBinding under
HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters
on Windows.

All client tools using ldaps also include the correct
channel bindings now.

smb.conf changes
================

  Parameter Name                          Description     Default
  --------------                          -----------     -------
  ldap server require strong auth         new values

Changes since 4.20.2
--------------------

o  Andreas Schneider <asn@samba.org>
   * BUG 15683: Running samba-bgqd a a standalone systemd service does not work.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 15655: When claims enabled with heimdal kerberos, unable to log on to a
     Windows computer when user account need to change their own password.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 15671: Invalid client warning about command line passwords.
   * BUG 15672: Version string is truncated in manpages.
   * BUG 15673: --version-* options are still not ergonomic, and they reject
     tilde characters.
   * BUG 15674: cmdline_burn does not always burn secrets.
   * BUG 15685: Samba does not parse SDDL found in defaultSecurityDescriptor in
     AD_DS_Classes_Windows_Server_v1903.ldf.

o  Jo Sutton <josutton@catalyst.net.nz>
   * BUG 15655: When claims enabled with heimdal kerberos, unable to log on to a
     Windows computer when user account need to change their own password.

o  Pavel Filipenský <pfilipensky@samba.org>
   * BUG 15660: The images don\'t build after the git security release and
     CentOS 8 Stream is EOL.

o  Ralph Boehme <slow@samba.org>
   * BUG 15676: Fix clock skew error message and memory cache clock skew
     recovery.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 15603: Heimdal ignores _gsskrb5_decapsulate errors in
     init_sec_context/repl_mutual.
   * BUG 15621: s4:ldap_server: does not support tls channel bindings
     for sasl binds.

o  Xavi Hernandez <xhernandez@redhat.com>
   * BUG 15678: CTDB socket output queues may suffer unbounded delays under some
     special conditions.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


======================================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
======================================================================



================
Download Details
================

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.20.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

