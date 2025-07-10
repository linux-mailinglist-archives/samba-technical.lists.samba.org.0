Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276FB00584
	for <lists+samba-technical@lfdr.de>; Thu, 10 Jul 2025 16:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8JGqg5XlIH3p/pqyRTuD3ZPyrMtjmNVLn2hj19k/hxU=; b=dUbpq7J+Mh1FIn/ysxb2C9KqEU
	GWl6+T08f8PjdOpxHELze4qvbGrAjpNs+KOL3ZYGndkqXoGTIkI3kfxBoS6qrbsKWFqtyTwvi+vaC
	Eb5wBY4vE8zX1HkTa0MUkXhMz3ul9ZeuAYySP5BN98ndRhoUJWDd4h0PSV5kqRmHYxLjvmqSl+PQI
	vuGXX7f26SpipOyznSeY/2l96Ee5AAf4FzRUn5sElQShs14X0BxgYVcDM48SnaREmyq3+xqstTF8b
	HFglj+OHy50rdO71aSqC2hlGL4/JsF0yUXlY1rRwN2Xx0JgxdKGgZjMfwimVZ8U8rS8euG3ze9woB
	Bo/g/0iA==;
Received: from ip6-localhost ([::1]:63312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uZsWD-00AwMR-2y; Thu, 10 Jul 2025 14:45:01 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:59451) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZsW7-00AwMK-VH
 for samba-technical@lists.samba.org; Thu, 10 Jul 2025 14:44:58 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6faf66905adso6836676d6.2
 for <samba-technical@lists.samba.org>; Thu, 10 Jul 2025 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752158694; x=1752763494; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8JGqg5XlIH3p/pqyRTuD3ZPyrMtjmNVLn2hj19k/hxU=;
 b=N1nJ/G44MkqSMSxJaf5qxZ52S64Yy93oF1dI6eKzE7g92pRCjqA4ZUDi1jIgr6agfT
 o/08bo01p4BlR9fFtLlamvG1issHjfQZwao9BK80cSpnb2wi1Z/30P1BSzYGgPkG4vzA
 4hY2jDMCVE5qmAgiNITjT6L2pwxtkHeUiCr3v+7r5eHaVCAWUZfKpP+3kUm5uRSGG/xW
 BRt3pIDG0+LVswSy4FCHhya81TGO8TPeY+D2bfshMuCMUfXf3b+E/6LjQA1CieEiFCtz
 AIURX0wXTCQY5KKz6s6oxTYi0PT9M1XlWxwbdbyOePsd5UdNzNaxs13ZR1Y1iNSVhTaH
 vC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752158694; x=1752763494;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8JGqg5XlIH3p/pqyRTuD3ZPyrMtjmNVLn2hj19k/hxU=;
 b=knQ/Z3L82YMl8Y7tPX9pIv2eoRl1Qkfd49FeriBEkOBt2Xt9QgJsgNA/KWj5Ab3fn1
 FrCSuXOLxgez/PenzPkWbAzIkb0Jnpq7FeHpJ4i/ArLqV13H4SNLR4LmGs3qumuWFvn2
 Of3twfUTjGjvanS6LYsQ7pBlvwvsAAnfHF8rrLpXK+pBUQjfUlnTjhGa5fRMZGhlJ8s7
 FRdE+rz/9Pm8qUe4q9y6vCh4tZgbD/KEQhoZ1tXBcMXHkEsmWzrkUXejich09P71t3Bt
 yPU49+Urh76ivI3gQSsXvM3RwBorUIXRjwnnVPIUS7Qt56TbfdaRgdgR6Wv+4xdf6zAV
 NXew==
X-Gm-Message-State: AOJu0YwKWH0Bsy63sScxkXG8BOTfRjcBs+cTRzz8+FHbqve+qfx2ncKZ
 PDoBt3MAkQjwW3soP3Nd4vxF1sCMzJ8MBoE5o5I1I7sidAP+auZLBTTAYOG70myDjW6bp48M0+B
 VysStGzknFM15ASuRIl5D/yhfQSjK6qAudXrJoH8=
X-Gm-Gg: ASbGnctyWS21NFU6wwHu/6YKXkccKY3yIhcuiOMqki2H6TZ7RTW5YJezlDyVAnnMoAC
 1SORbTbukoE8K6/Voz3v4n05OlUBpOAUjbj9NCXzZYXRIiWfat6HxqV3edM5iqFQjk95NKxG+JJ
 bDvlFNedFHe0EUH2wf68JLBXSNQ1uylc71B/MO1JyEqkFE83HA2byzHv5PDZuGBgo9e2rkRmACf
 Rs=
X-Google-Smtp-Source: AGHT+IEMAW0QSifQLTT+KZeo+hzCVVLm0BJrJGHv4XN9d1cZlT2ffXJW5YzNlpOaMQn+4EEa2MtuDIYEEUIOPX49hFg=
X-Received: by 2002:a05:6214:3d11:b0:6fa:c8c7:82f7 with SMTP id
 6a1803df08f44-70498128fd5mr36503606d6.20.1752158693585; Thu, 10 Jul 2025
 07:44:53 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 10 Jul 2025 09:44:41 -0500
X-Gm-Features: Ac12FXw7l0Yblv1PigghHKhIWC0A-n3aUKlKSfmpkPBjnDLXzzPx4BUgb8XqGHQ
Message-ID: <CAH2r5ms7pSZaPEwTYUh17+be5xCrLfSuP1WNaADaxnfCBC8yTw@mail.gmail.com>
Subject: out of date man pages
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
Cc: Jelmer Vernooij <jelmer@samba.org>, Bharath SM <bharathsm.hsk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

How do we update the VERY out of date man page on samba.org
(https://www.samba.org/~ab/output/htmldocs/manpages-3/mount.cifs.8.html)
which looks like it is many years out of date?

-- 
Thanks,

Steve

