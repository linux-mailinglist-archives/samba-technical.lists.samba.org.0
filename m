Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715564DEF9
	for <lists+samba-technical@lfdr.de>; Thu, 15 Dec 2022 17:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jZGX/zJfFNKY/tC4SE/cZ7x9XlT82IhoDIPQ2uhFUYc=; b=Vhy5RYo3XTm5q/6tu76fVNLFPv
	w00VDNVul5dgVnovd22CUSmjM67oOUFxEvjGL6uJwML9c0d9yIyeQtv7ip5fyy33v2XrZ1519puR/
	6DK01tGARahT+/zTaZ2lYrj0FTZrwzquQKJdSzSN/gV4GjKxrg2PX0IET+G/DyfX8HxGmviBQ89Ju
	NjpxQtTwUTYiw3HwgrR0yfU0936/8fJ9NkwIA6UNLqYSeH4QgQHFI73bWrakwjSF7lI2dIEn1mRKx
	jCuTj6Yj8TWiNIsPDz6FTg4zRstyAPvyw2WDgkkdARQwp8hP/XL4w84PCu7jQLZGrQFyYjipUHooZ
	ngYgaukQ==;
Received: from ip6-localhost ([::1]:52724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p5rQ8-009VOy-H1; Thu, 15 Dec 2022 16:49:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36910) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p5rPy-009VO2-6v; Thu, 15 Dec 2022 16:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=jZGX/zJfFNKY/tC4SE/cZ7x9XlT82IhoDIPQ2uhFUYc=; b=XWo36Wf/icEkz+hRbFL3Z2jVFI
 JzdJOdXewNCW1wUm22eEOCn+Q7U384PtnMryHrDg7bNCquNcKjbCOj7cE6/8lImMElFI+kQQisYGJ
 dWjBdWbTy+U0DNl+zQO4ypJFO36IoH4ZAY/mjtNuOCxD6dm9jxoievF3rSmlUnDIGF0i3BFpzmREx
 nvtwYgLgAQNf1T3r67SDGWHuwxrt8ttNOG43F++KKdut/kIMXBxkGq3cj61zjVxeiG7Tqwi36I4Fx
 VurLaXkw0CQ/UbkyCc7I3Vn8DtsbWmq20CM3QkuTg/4RvqqEI7FAzoMkX3Rf7xQkG/bPlvOIQ28BN
 OVfKy/wVAVUeQglblfZcQdRsRDhNub4e9q5o2ezLUmk/H4IuFFdLQ9L/Ivvs5gPmG/5RV/POId7/G
 jPF0snfCj+icJynBGHrM1iL16+ygwVQMu8UGFqy5EGeq8Osv0W+HS0OCgaNU8BOUSyrsm3kWU6/kQ
 7Duq9DNBkaFBEztf4SZlgW4x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p5rPx-0045Gc-LU; Thu, 15 Dec 2022 16:49:09 +0000
Message-ID: <fff8f470-f67f-a92b-8f38-d1adb0b9e5dc@samba.org>
Date: Thu, 15 Dec 2022 17:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.4, 4.16.8 and 4.15.13 Security Releases are
 available for Download
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
---------------------

This are security releases in order to address the following defects:


o CVE-2022-37966: This is the Samba CVE for the Windows Kerberos
                   RC4-HMAC Elevation of Privilege Vulnerability
                   disclosed by Microsoft on Nov 8 2022.

                   A Samba Active Directory DC will issue weak rc4-hmac
                   session keys for use between modern clients and servers
                   despite all modern Kerberos implementations supporting
                   the aes256-cts-hmac-sha1-96 cipher.

                   On Samba Active Directory DCs and members
                   'kerberos encryption types = legacy' would force
                   rc4-hmac as a client even if the server supports
                   aes128-cts-hmac-sha1-96 and/or aes256-cts-hmac-sha1-96.

https://www.samba.org/samba/security/CVE-2022-37966.html

o CVE-2022-37967: This is the Samba CVE for the Windows
                   Kerberos Elevation of Privilege Vulnerability
                   disclosed by Microsoft on Nov 8 2022.

                   A service account with the special constrained
                   delegation permission could forge a more powerful
                   ticket than the one it was presented with.

https://www.samba.org/samba/security/CVE-2022-37967.html

o CVE-2022-38023: The "RC4" protection of the NetLogon Secure channel 
uses the
                   same algorithms as rc4-hmac cryptography in Kerberos,
                   and so must also be assumed to be weak.

https://www.samba.org/samba/security/CVE-2022-38023.html

o CVE-2022-45141: Since the Windows Kerberos RC4-HMAC Elevation of Privilege
                   Vulnerability was disclosed by Microsoft on Nov 8 2022
                   and per RFC8429 it is assumed that rc4-hmac is weak,

                   Vulnerable Samba Active Directory DCs will issue rc4-hmac
                   encrypted tickets despite the target server supporting
                   better encryption (eg aes256-cts-hmac-sha1-96).

https://www.samba.org/samba/security/CVE-2022-45141.html

Changes
-------

o  Jeremy Allison <jra@samba.org>
    * BUG 15224: pam_winbind uses time_t and pointers assuming they are 
of the
      same size.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14929: CVE-2022-44640 [SECURITY] Upstream Heimdal free of
      user-controlled pointer in FAST.
    * BUG 15219: Heimdal session key selection in AS-REQ examines wrong 
entry.
    * BUG 15237: CVE-2022-37966.
    * BUG 15258: filter-subunit is inefficient with large numbers of 
knownfails.

o  Ralph Boehme <slow@samba.org>
    * BUG 15240: CVE-2022-38023.
    * BUG 15252: smbd allows setting FILE_ATTRIBUTE_TEMPORARY on 
directories.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13135: The KDC logic arround msDs-supportedEncryptionTypes 
differs from
      Windows.
    * BUG 14611: CVE-2021-20251 [SECURITY] Bad password count not 
incremented
      atomically.
    * BUG 15203: CVE-2022-42898 [SECURITY] krb5_pac_parse() buffer parsing
      vulnerability.
    * BUG 15206: libnet: change_password() doesn't work with
      dcerpc_samr_ChangePasswordUser4().
    * BUG 15219: Heimdal session key selection in AS-REQ examines wrong 
entry.
    * BUG 15230: Memory leak in snprintf replacement functions.
    * BUG 15237: CVE-2022-37966.
    * BUG 15240: CVE-2022-38023.
    * BUG 15253: RODC doesn't reset badPwdCount reliable via an RWDC
      (CVE-2021-20251 regression).

o  Noel Power <noel.power@suse.com>
    * BUG 15224: pam_winbind uses time_t and pointers assuming they are 
of the
      same size.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15198: Prevent EBADF errors with vfs_glusterfs.

o  Andreas Schneider <asn@samba.org>
    * BUG 15237: CVE-2022-37966.
    * BUG 15243: %U for include directive doesn't work for share listing
      (netshareenum).
    * BUG 15257: Stack smashing in net offlinejoin requestodj.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15197: Windows 11 22H2 and Samba-AD 4.15 Kerberos login issue.
    * BUG 15219: Heimdal session key selection in AS-REQ examines wrong 
entry.
    * BUG 15231: CVE-2022-37967.
    * BUG 15237: CVE-2022-37966.

o  Nicolas Williams <nico@twosigma.com>
    * BUG 14929: CVE-2022-44640 [SECURITY] Upstream Heimdal free of
      user-controlled pointer in FAST.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

https://download.samba.org/pub/samba/stable/

The release notes are available online at:

https://www.samba.org/samba/history/samba-4.17.4.html
https://www.samba.org/samba/history/samba-4.16.8.html
https://www.samba.org/samba/history/samba-4.15.13.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

