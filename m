Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ECBC514B6
	for <lists+samba-technical@lfdr.de>; Wed, 12 Nov 2025 10:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vAjL0TzTC6CaLzL2Pkp3Pu+AxdO8TfYeW9ZapCXJIBo=; b=XTqTw6ZPwSBTn9YQKswvrDY3/m
	Ze/Rop1I1A41K0KVMhu1ENNQ+CoB4pvmkDnff5dwFNfNklyglgCCv541WlV6eQFClanbo4WSn3WVH
	j4LmT4JKrU3QsLpKwOwpUF6gDQNR/WXQghpbU2Btf/RAVnnyUeldO+5iS4qEKt7QeopReNO9qTtkR
	d9cBanZguw8EF4c1qrKQsRiOt2O2kbs0girVrxgaty+a8eOhejB6UURJYH3VBz6pbRbVt2p+obTkR
	0f00i7b+Vkv1Usm1oHIbted+rGo0Cvr7zlcYQqRGAZpciEMmzra90eRpP6jk8+fYKS3fvm+kiuM+w
	pAOnGm4A==;
Received: from ip6-localhost ([::1]:30172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vJ6uI-00C4Gb-J7; Wed, 12 Nov 2025 09:12:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14902) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vJ6uD-00C4GU-7v
 for samba-technical@lists.samba.org; Wed, 12 Nov 2025 09:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=vAjL0TzTC6CaLzL2Pkp3Pu+AxdO8TfYeW9ZapCXJIBo=; b=wiZAnu2w+5LZerFu3970Ef25Si
 sj7OHw7wqrRmA0eufVHLmY2h+S8gpO9pzQ6zurRn0OxSamWCWlhNHjqeG/xhDB5zhVOwMPpjH3znh
 tGDOOFjjvT03Qeu/dRVFMCDFTq5n34W0dphp9N9++lVE1iEIsp2VcFW1d85EE15KwFnQYKWk3Sw7n
 5AZcJKxw2WQfp7uVBpNi90uyHK8QrJD1FjpZoVpD/xuPZVzJ8qr44EXYzKnaQmaAOoUGtW8Z3Rcfw
 eLPnlb+vMisLTSGR4qkuB2gbSFZ91Jy1XH5gAJ4uvl64jWmUARUfs5rrBcrh5eIIewpGDOSjdu8CE
 FqUxTAfQzDODyinns9oc2Iucg6vlnRmyaWMjVtH7Wx60SC2Hv6+z2rs/23wlqNcCSQ+huKaFflHOf
 VQzr+f/+PmcdAkQXhNBkT40/QLGBa89fXzUVd/9jh5dqfF0rM3vAoWs74OmhGP8ortOI4Dqfaadxf
 5aTXbS/KQJuV+DjPmlWp53Ro;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vJ6uC-00Djn3-1Q for samba-technical@lists.samba.org;
 Wed, 12 Nov 2025 09:12:44 +0000
Message-ID: <78cb6a52011be3c47f0865a904bd49430d4c8487.camel@samba.org>
Subject: Fwd: [FOSDEM] Call for participation: Software Defined Storage
 devroom for FOSDEM 2026
To: samba-technical@lists.samba.org
Date: Wed, 12 Nov 2025 14:42:32 +0530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Like in past years, FOSDEM 2026 will have a Software Defined Storage
devroom again this year. Feel free to use this opportunity to show how
things are progressing around Samba and consider proposing a talk !


-------- Forwarded Message --------
From: Jan Fajerski <jan@fajerski.name>
Subject: [FOSDEM] Call for Participation: Software Defined Storage
devroom for FOSDEM 2026


FOSDEM is a free software event that offers open source communities a
place to meet, share ideas and collaborate.  It is well known for being
highly developer-oriented and in the past brought together 8000+
participants from all over the world. Its home is in the city of
Brussels (Belgium).

FOSDEM 2026 will take place as an in-person event during the weekend of
January 31/February 1 2026. More details about the event can be found
at http://fosdem.org/

** Call For Participation

The Software Defined Storage devroom will go into its 10. round for
talks around Open Source Software Defined Storage projects, management
tools and real world deployments.

Presentation topics could include but are not limited too:

- Your work on a SDS project like Ceph, Gluster, Garage, OpenEBS, CORTX
or Longhorn

- Your work on or with SDS related projects like Samba, OpenStack SWIFT
or Container Storage Interface

- Management tools for SDS deployments

- Monitoring tools for SDS clusters

** Important dates:

- Dec 7, 2025: submission deadline for talk proposals
- Dec 10, 2026 acceptance emails
- Dec 15, 2025: announcement of the final schedule
- Jan 31, 2026: Software Defined Storage dev room

Talk proposals will be reviewed by a steering committee:
- Niels de Vos (IBM)
- Jan Fajerski (Red Hat)
- Hugo Gonzalez Labrador (CERN)
- Richard Bachmann (CERN)

We also welcome additional volunteers to help with making this devroom
a success.

Please submit talks at https://fosdem.org/submit

- Important! Select the "Software Defined Storage devroom" track.

Hope to hear from you soon! And please forward this announcement.

If you have any further questions, please write to the mailing list at
storage-devroom at lists.fosdem.org and we will try to answer as soon
as possible.

See you soon!
-------- Forwarded Message --------


Thanks,
Anoop C S.

