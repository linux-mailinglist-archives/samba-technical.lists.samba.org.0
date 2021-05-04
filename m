Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 206053726AF
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 09:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XmCkwx2ecOOCtuq6u5FG6/kmgc1njgEdPDkq3uuy6kE=; b=Qdok2zF5NYOdpiDq3SCkKlrsHJ
	zP3VGbC6JKd20dZLVwTN8KDYqtNvjlCrbtvb+BO5xl0OHmO3EcZY4KI2EKYQo/UCmClKjvyTwwP4L
	Cn1Qov8yQ/3d3qOzxufDYmK27mhGPECDRRemcdZcqhy5uL6tXOcCKRkstt7Rr5x5w04Y6IcpFITOI
	PEnER0oj1RZ114V1MGoH1BtZkvtr6OEvZHMueq5duq/5bjh47nfHhUyXuDofs0Ul0A5UI3XM5XOmb
	AGqzo8Zje3YVcHKFPHLWKbvVJkZ8ahQbSsmkDf2cQcdxmzjkgDsjq3uF7JQ5QQoCT8pt+/gQG63Es
	XC+CPMBw==;
Received: from ip6-localhost ([::1]:43530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldpf8-00FOvB-HJ; Tue, 04 May 2021 07:40:10 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldpev-00FOv3-Gr
 for samba-technical@lists.samba.org; Tue, 04 May 2021 07:40:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b17so6283307ede.0
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 00:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XmCkwx2ecOOCtuq6u5FG6/kmgc1njgEdPDkq3uuy6kE=;
 b=N5/0UYVQgLhxRH5CSmBM23Fmau1S1W40bB6iG5izbhva8v3aBfq8J8Zr+2i9E7UqtB
 uLHlBMQ90oYcYK0N6OZsXvxPJQwc4RCyJDx4xAve6hdsHq/TJRJjNbXzNtauzDojLUIv
 Os9kHEzTNgBjGGTjb3pX6bk/rM9/mLcV4NlMth05odiM6QaCelcJnndMpGhQrToLD9dx
 Qan9PGkH3NlrJALd7kfVkDe6Jdbh7DeNaBIFWlMmHmiMlzdoSOF+DFjY4d3SzF/tvkKb
 NiTVX99WBN8aATzeJoxDKqnARDQrZZqjt1F7zhbv6C9WEYmnQA+B2Fmdzi866SSLJQo0
 aRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XmCkwx2ecOOCtuq6u5FG6/kmgc1njgEdPDkq3uuy6kE=;
 b=lyIR6mQmoghH8WLI8GKYiAypQVhrv9J6OLnMWF5NbylUYN0yg1hm9udpFknfW5o9SB
 XpchS9acMwliNTv9s0eLZ7hfPABIF58+jgxma94lKIy4WBzZSJ6DSrMeALAFk7Vn8mAz
 bVT/SKG5QuMiHujNAABXB575nkdArcKMkWcMX7CyIq3mNF59udfOOFi8VO21RtVC8BdN
 gPfHYbBdvcH0LmWk7/8fybcefJAZjnOkgOtts6jhPHSjEnaV8l4i4XIqP4jVHckkqB63
 EV+fH+9/l+aDWtgELH8LEAU55RvY5FmmA0FargVCOmBJ9z9lpI719vGU11bGu88JGS/U
 eCzA==
X-Gm-Message-State: AOAM532+9AT4Bs8t3Ip6tkzzdbTa+ZBvdZCHHMzOa5jCMwDCMcYHnTqX
 2ShgbjRiEaRrgMwD+ZPoNTi8qWgqGdhmx/jct0qWw8CYHXR5MA==
X-Google-Smtp-Source: ABdhPJx6hVYUJxliGBrTMGP8Plxqr7M88qcawsgO+xmSPo5W/P2RwA4JglDGeHMlBPkkygG/sBf6Pa4SxpJV2zTuPpY=
X-Received: by 2002:aa7:dad1:: with SMTP id x17mr13675754eds.47.1620113996354; 
 Tue, 04 May 2021 00:39:56 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 May 2021 15:39:46 +0800
Message-ID: <CAC6SzHJXOrFWYas9TT7EkE3AuiwXHEZtQaVsCHVg7DbhpeAbJQ@mail.gmail.com>
Subject: simple password sync method
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: d tbsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: d tbsky <tbskyd@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi:
    in old days when we are still using 2003/2008R2 as domain
controller, Microsoft provide a password sync service "Identity
Management for Unix". we just need to install the unix side tool
"ssod" then AD will give our script the "account/pass" when password
change. with a script we can do any kind of password sync.

    when we change our domain controller to samba, I assume that "unix
password sync = yes " would do the trick. but I waste my time to test
it and man page didn't say it won't work with domain controller at
that time.

    to solve the problem, I could only do ugly hack to samba source so
it will trigger a script when password change.

    now I understand if I save samba password as encrypted clear
password, then I can use some samba-tool command to get/sync the
password.

    I wonder if the old simple method can co-exist with the current
one. maybe just a config like "password sync script = xxxx" and let
samba trigger it when password change? although with clear password
you can sync it to new service at any time, but old simple method
doesn't need any infrastructure change and doesn't need to store the
private encryption key.

