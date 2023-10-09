Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940B7BD269
	for <lists+samba-technical@lfdr.de>; Mon,  9 Oct 2023 05:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=F25uLhiY2el/6VY57mqoqlyozxz7V8aXB4U/G+qj6wg=; b=QvUaPy2ZM9NRmlgYE7mz5qZsFM
	er2NXN9Ny7Uq0JEDr818U1w8MLHb7TQfD8wkGMCQXa9WoMgFZOuBp04Ea1Xs4m4Wxvme2Eb4IKM3c
	7nRimj25TNGgFHJQ/SOgGlfGEUcSbLdzrjAAww8APXQ1yo3Aj7aJ7kD9dWoxpiLBeK7ZVnUWGVaov
	qkBqD+7fX5ALZMQbKa+ttQrvtwMPU8tkS67GDTzrhnZq8IaMBn2i7GqoG3jhvIFEjziv3E0wn5TU3
	Bi3Fgn1Ohj3GIdosABXW0aCeK43Y2xHE1OGNeHjZIn4kQsRFgrctcWHWt5EtSQURXdw/z7fPQK6Qw
	aJKGL0ig==;
Received: from ip6-localhost ([::1]:42344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qph6o-000cxG-HQ; Mon, 09 Oct 2023 03:39:05 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:47341) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qph6k-000cx8-0E
 for samba-technical@lists.samba.org; Mon, 09 Oct 2023 03:39:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50437c618b4so5039458e87.2
 for <samba-technical@lists.samba.org>; Sun, 08 Oct 2023 20:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696822739; x=1697427539; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F25uLhiY2el/6VY57mqoqlyozxz7V8aXB4U/G+qj6wg=;
 b=W6vFYxhZftEnK5KmKLRGKcl5AWIgaBkCdUbdielqJJwu4ZgLj/r4kLgrG+bgIB0Y3j
 5rxtgfSZAP0pYgseb43n9kQ6rY1ug/isrNG8YdsOWYJqfmpmZB6knAhOm/FRRQ619yq5
 QEN0jkmDEAi0F+fqjwjv6o0bGcbCWXAzTB+ct5cz0WvL7mSo5VTKSWSE1fuzFezAfttt
 F2CqYIuw4Kb+ZwcthljC+eJMclqTUYOmoyB4SI1ibWTvmH/GV3bUMCKCZqmh+ELmYayA
 Ubp4LdEX0tWja8MrXbtyrXq6kZPPvMu09s/4GH1rAnz8jCdKUlvfL9TY+3sdTjgtfIlZ
 5i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696822739; x=1697427539;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F25uLhiY2el/6VY57mqoqlyozxz7V8aXB4U/G+qj6wg=;
 b=m6X2yH2piftxaS+3UpGzPrOBDdKZJ7pF/W0TxuWMEKfu8LpTGDdqMHviFcf9mxEFv0
 dSaG9Vr+bEjCyGc+LZSwdA15e7PeBz02po9qUN0X7xTyF2/0ILIPpGtaEBvps+iSUkrM
 FUJeoTKPN/ZgBKli740gEIOkakEQK97aQue7kAQnVcnnzmpDdwZCXO59YNoBT+gwODG/
 WHLtkSerVQZ/SUn7fMJCwEGSIlb+fPTI1i/S5LyfR5pPMdRuP+uFUgQrPFVElvxmXtQh
 /ZG8QjrVSs6QA3VcsoHK3uIwp/rn4LcOe+bFtk708y2ogR4xCxvUlPFxP5Xav3rsgkrN
 Jr8Q==
X-Gm-Message-State: AOJu0YyV5bEtPVTtJLjOoQDDREsw/uqvWOqZGEM3Zpr6tf6AaWjxuSOX
 54NblXsegR47D7dqPhozBxnS5l5cWElp80faJ7XXYkRTTKs=
X-Google-Smtp-Source: AGHT+IFVIBO14V13vJBlhclqeZVm2nowlKI3tTxF61ZqBKFZPCuJlVugyd60rvYOoCB+Ag/STZzgZnZLCydVXCPmnoY=
X-Received: by 2002:a19:435c:0:b0:500:91c1:9642 with SMTP id
 m28-20020a19435c000000b0050091c19642mr11859253lfj.21.1696822738602; Sun, 08
 Oct 2023 20:38:58 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 8 Oct 2023 22:38:47 -0500
Message-ID: <CAH2r5msM0UXTF2nLCSMb1KdjSP9ehVmuc2TL2RA_YG2Dww__Qw@mail.gmail.com>
Subject: SMB2_SHAREFLAG_RESTRICT_EXCLUSIVE_OPENS to improve POSIX compat
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Has there been any previous discussion about the share flag
          "SMB2_SHAREFLAG_RESTRICT_EXCLUSIVE_OPENS"
to see if it could help improve POSIX compatibility if it could be set
on a per-share basis in Samba and/or ksmbd?

-- 
Thanks,

Steve

