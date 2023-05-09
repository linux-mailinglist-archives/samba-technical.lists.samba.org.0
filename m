Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A16FD097
	for <lists+samba-technical@lfdr.de>; Tue,  9 May 2023 23:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kyGMSnqu/87Y/wiriDnSPhdcgaTesUMAMjWZZRsVei8=; b=DnfUOIZzx0YvyBZZ3XKfIBG/O3
	iZ8onPvPMnSH+HnyoMr3LssOy8Lodcvvhu4YRY/UGWm0cO+1RfxqkRnFl4M10+P8PpVMQz6MUmZD8
	fhDyb5HIWvtmrGyqquIKSyz0B7Q5g4XTMjIxiJLmEsHgIaz/RQR2rfwcOj8te6E6z2kpaRYwq8HtS
	7BA4uX50p/oko8a52R/1Q0rw/iRjqYSiKPKSDbuWRPKWeQcZCDmlxis5Fr42VTKYwg8U8JdGRhw1V
	7RLOdDMk4yjAM0rxoOJPGCrizhy8OYHOjvtC4mtAkm6EDFkuHpio17dsIWdYoDim6YY0MpYXJgsks
	2/FhjY/Q==;
Received: from ip6-localhost ([::1]:61022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pwUg5-009EUW-TO; Tue, 09 May 2023 21:15:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:53660) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pwUfx-009EUN-Qi
 for samba-technical@lists.samba.org; Tue, 09 May 2023 21:15:18 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac8cc8829fso53694411fa.3
 for <samba-technical@lists.samba.org>; Tue, 09 May 2023 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683666910; x=1686258910;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kyGMSnqu/87Y/wiriDnSPhdcgaTesUMAMjWZZRsVei8=;
 b=Rz+XnTQJJQ8QmExAf9gurwEIvZkpOn/5ghFg8nYV9tKww8QzPbg0H5TJ3SAoKKlpUl
 8xJWNVOueO6r69SiMsmaHzZv1eOH2Ve1FJrmKLe0VL0QxclWHim9fx4wVrdH5J/PkDH6
 vGiXaeGQlhhwpBUh435O+Yohbmpz7X9ddi+zOWDxVJHfyFsF/1hPiTA0XTidJzeHh4/B
 di/juXNHvuEhhV3JK/tBCbC0ibzP/cr5p4InkzWiPlg3JiXHJ+XyQzPdzwe7ueRPFLwG
 mrtRwjqY2xwomeCH/hbHWu78k3cPjbotemjtY2PYjvEmsdQ5CinoDzvGZhaYZkzThVHn
 umCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683666910; x=1686258910;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kyGMSnqu/87Y/wiriDnSPhdcgaTesUMAMjWZZRsVei8=;
 b=KZaYBAbIqFbfFJiJ48CFagHSgcoWZtTeg8ZSmcd3L/Mejy2lfrZexcX58GDUXbjbPt
 Gk5+v+U+8otu+EuLKlBfZSTamlThY3EEVikntDLdmwfsZtvy4SnJDRRmfkmsrpAbAWjV
 7m1OoBH9uHcwpMtRGJJpx7WEmLfFzGiogVLfO0dX0WkgGpC+BuJKhgS2G9q2wSL50c1e
 4iByFdfler8jtfqkOc8ojfvHRJ/6YDtN8VOEIAHnVAeyuDWeMeHGKE4WPT1VIcppiC4w
 7+yjmYK4dKiQj+B/SsXb2aFFVfDUmVTPIj8na3Iv73Z4FjbS1lT+v6EXPdmyL58FELxZ
 CKvA==
X-Gm-Message-State: AC+VfDyJVcqL9PB5HKz1GVt74tiSUbepc/Cbc0zBc9P/gnzYLZTgLJS0
 G9mIZ5Rod8C/vCJupRK2UDmsKDyFHSEms9LYmg/AN5ytC8bgpeNV
X-Google-Smtp-Source: ACHHUZ42k5IyeAuP106a27PjwHLnqDhpQaGAxEs5Jy9NR0SST550sdokMcP6oVbF9lJxKH5i8GoCTjPcaMxqoh/+85Y=
X-Received: by 2002:a2e:9c86:0:b0:2a7:6c78:1624 with SMTP id
 x6-20020a2e9c86000000b002a76c781624mr1287036lji.27.1683666909971; Tue, 09 May
 2023 14:15:09 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 9 May 2023 16:14:58 -0500
Message-ID: <CAH2r5mv57D5GD2ekA7XhfSEp-n8+nrwn00eV8D6dgiX6urU9Tg@mail.gmail.com>
Subject: server reports incorrect file allocation size
To: samba-technical <samba-technical@lists.samba.org>
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

Running xfstest generic/392 I noticed the allocation size was reported
incorrectly by Samba (more than 4 times the file size, and not even
close to what XFS was reporting locally for the same file).

Was trying this with recent Samba version:

# /usr/local/samba/sbin/smbd -V
Version 4.19.0pre1-GIT-3633027e49a

-- 
Thanks,

Steve

