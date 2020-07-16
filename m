Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07022239A
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jul 2020 15:08:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=K6n2Wm3h+tMP5FjwT/wDFJFh8o
	JqL6oIat1p5ncMfeLeKeuu9cE5/QHBKATMjxr+zZSi/y9fBBF5FipW+9MUJDixmPRIxjwZebJ7an4
	5Np1v000BaVJhe7eCpG9oaYreQ7ZRqmDqn6pfSoSiLPGrGFkHlEVRCuuo/C9pnssajRkTSw0kTraA
	DkA/rf6uWV+lI+z6Jn56wffS+cwsoXx5SwAtHYZMVlkuUiO4qWXMs3W61bPacpxvCu5kPpHHk/bm/
	/xaBEVLdk0pR3YdkDUebWM/ttksCSs0QuRIr/0TdLKFbMb/OBlmfiT7gW6/bvGHaiRTGtQw+QIZnJ
	JCDOrzXg==;
Received: from localhost ([::1]:64348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jw3cK-00897w-VQ; Thu, 16 Jul 2020 13:08:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32806) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jw3cF-00897p-0A
 for samba-technical@lists.samba.org; Thu, 16 Jul 2020 13:08:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id f18so7043097wrs.0
 for <samba-technical@lists.samba.org>; Thu, 16 Jul 2020 06:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wmdlqNesw5qrSFRc+23IKh5tvrepWp/VrbiSRJo7Occ=;
 b=CVNAzshVpXvFpHa2aTIXmsHED9tFFzX2mB2GN7Foq/uOrbWyR5cRH0oYMQSlxT5aSq
 J2pW70XalOjO/34yLxb7inyBRdw1Nqx6PZrrZGALejaNdDQUU7vswSr+yFoVDfioY/mb
 PoN0OYytRhCJ3zbjTwayHJlPu8u+LU2PvjEv/tmrY38fJ4uOCEiKpXQ31CVH07G+oJJG
 fVKVvEoWwVkNTry4Cix7xhX977qmcgDSufapNLKV1qhDOut9I5kcveJZmUOGRs6o5SFc
 +4TE0+yzajhxASshpo9vZuNdlcvgz3KEtuxqhjP21IdJNC2IhArMpuBu6II3kVKXKNGX
 reFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wmdlqNesw5qrSFRc+23IKh5tvrepWp/VrbiSRJo7Occ=;
 b=ng3g21ZUHtyBqM2A5Kuf/jZKlMOodrAZ7SPtYrJbAAZlhRo/f+VD/C7WuZ0AY/JGiL
 sVqD2TcY62Md8L+lZuFzHY7K+2WRJJbmgKDhzvov1bVRs/WDZqw9hhqvNI6OxfwV36Ap
 SRx11qhbb8o/IKM+8NZAvHVr2jauDrdtRD8D3d3Cdm75JGhIWojCCE+9FDxiNlN77v5A
 yYuNAwv2A7Y2i0SRA5zsoD9nMiSsqoD96qVR456+DsR/nfNL24LnQUqYJRUPdu4hibtP
 B3JYbordopMNteeu2YQxRyNnfUfYnHHQUhCP3+CTR7jbChJ0SekLKpomB4KipCkhhAPV
 C6Vg==
X-Gm-Message-State: AOAM531u4RAu+N+VDAWBXF2b8RngbhkdsZxluFtoIbZYbWj7hDrjUWp8
 4UgqTjlxJoJZajU30qsyJjvzdjc0YtTOvI6OgGHMqQJ8acje9Q==
X-Google-Smtp-Source: ABdhPJwrhDy4/DsdKw5giPTwwo7vMqKIdUfrpp54uxdDO/OrKjMEa/5pr2ZqlxrAoBe/16g46/ORU905JJDvaECNoAs=
X-Received: by 2002:adf:f34f:: with SMTP id e15mr5034002wrp.415.1594904878219; 
 Thu, 16 Jul 2020 06:07:58 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 Jul 2020 15:07:47 +0200
Message-ID: <CADCA1Y-_wFo43WqatAvyig0fbwx8Js+5b4s+-WS-Fk0AqvxXZA@mail.gmail.com>
Subject: test
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Marius via samba-technical <samba-technical@lists.samba.org>
Reply-To: Marius <m49649462@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


