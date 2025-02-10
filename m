Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB9A2E6D8
	for <lists+samba-technical@lfdr.de>; Mon, 10 Feb 2025 09:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hrnvQUFpJKzh6jF0LTVbI/FE0Sc7g8acsQlSHV7kOuM=; b=LxJHtOYSifQ37PFED/nfBfZ+mQ
	70NwpFwl8md1RAxp8l4MW0Vi4VgdeXzM6zhhwFMQQqgUldpq107BuIJBo6sVna00SiijJ6Wu14LKW
	9T0uaToVSQl4J84kCFaQ2TWIXGJ2Z3AWy2vhBS9RidP//ghbg6G1ZQ/TmV/CdvEMcOxyKV+c66aWB
	0aqA5Fk8gNfzGe65WW7KnJMmhP9FBM5Z/Zh4+HQ2AgPWL/XBrAQN562B4kDRDDVy/L2s8/dsJc0hW
	WQa2AMe4s0Vff/xkBnlAsBfmJ7HCiAQNYG88CuBL8wP4z4CSHwVP5qy9xGF5DD3YL1iFjGs1VdviW
	Id5BThZQ==;
Received: from ip6-localhost ([::1]:23436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1thPTB-00C6Vs-Ef; Mon, 10 Feb 2025 08:48:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32966) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1thPT6-00C6Vl-CW
 for samba-technical@lists.samba.org; Mon, 10 Feb 2025 08:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=hrnvQUFpJKzh6jF0LTVbI/FE0Sc7g8acsQlSHV7kOuM=; b=LlrHQ1NEyK6KcVlKpECIr+GCW2
 cSy7gucV65B71VjEY7756mpX0t3HGnEQB3fdw3FLTcAJ0DpCk05lr2ht90mC7oNSqy9H20zwZU3/H
 AZJ+udjuA/mn/uq970QNaECBAhWlDK6ssg5jOthS66m507rH7hvxDi4juB1ByGMvAyKnAtXKye2kn
 0JZamq/LTR27WTjHx9WYF1ky1eYWw0tH/Z5kgNMcXMz1n9ThNL2yGptQs9MfbaGNY+V21iZg1jdUw
 rZqWAZcxJ7/HwUfh4qb+UdA63NjWnOozl8wKWqEwNMG+aVQojglvQQ+b/BG9YBdqghqylbV5SAQII
 tCRD+ZRqT3nYQEvI/CLYl1yD013GnsdLZH28uOivPOopnkR35w7OnlHKWNl2IQTOrC0tXJkdF7zW5
 F/330R770X/O0f33vRBFSWrw6Z3MnvbtFDagXsxf2QEAokyEy2il4hTfHiozMWK/HhJkWm+3XDDSF
 QKaJHYBFadQ6szakXVkMFDBO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1thPT4-001qgH-2R; Mon, 10 Feb 2025 08:48:38 +0000
To: scabrero@samba.org, sbose@redhat.com, Alexander Bokovoy <ab@samba.org>,
 samba-technical@lists.samba.org
Subject: systemd userdb: USER_RECORD IDM Extensions
Date: Mon, 10 Feb 2025 09:48:38 +0100
Message-ID: <2307349.vFx2qVVIhK@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I would like to open a discussion about the varlink interface Samba plans to 
provide for the systemd userdb interface.

An initial implementation is alsmot ready at:
https://gitlab.com/samba-team/samba/-/merge_requests/2928

As we have pretty much similar things as sssd provides, we should agree on the 
additional things we want to provide in the public and or privileged section 
of the user record.



# USER_RECORD IDM Extensions

For winbind and sssd we want to extend the systemd USER_RECORD. This is 
allowed by systemd as long as they are prefixed. We should coordinate what we 
want to put there.

Please watch Lennart his talk about userdb at FOSDEM:
https://video.fosdem.org/2025/ua2118/fosdem-2025-5071-systemd-s-user-database-api.av1.webm

## Username

Windind and SSSD should use the same username and probably the best is to use
<username>@REALM instead of <DOMAIN><seperator><username>. systemd has user/
group name syntax checking https://systemd.io/USER_NAMES/. We should keep it 
simple and just use the `@`. Then we can update the document and or code to
reflect this.

## Public attributes

* idmSecurityIdentifier (SID of the user)
* idmMemberOf (list of SIDs)

Is there anything else an application really would need in the public 
interface?


## Privileged attributes

We might want to add privileged fields for mimicking IPA passwordless methods. 
So far here are just some things we brainstormed from the IPA side.

OIDC integration:
 - OIDC client / secret
 - IdP information (URIs)
 - IdP user identity
 - IdP attribute to check the identity

Passkey integration
 - passkey (similar to SSH public key)
 - userverification flag
 - assertion info

RADIUS integration
 - RADIUS server info
 - RADIUS server credential
 - RADIUS user identity

OTP integration
 - OTP token details (TOTP/HOTP)
 - validity of the token



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



