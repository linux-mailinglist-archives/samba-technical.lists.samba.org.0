Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7721DBD53
	for <lists+samba-technical@lfdr.de>; Wed, 20 May 2020 20:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=IFb4ArdyzrAolvqt+QqWE+epQ0KSagvWb6FY/atZiRk=; b=MzP3zXzN0569Q2lQg9hi2wiafP
	D45fQyJWPxrwLCfYSgQ/tsdsDnp8/aFFs4x+R7KYuNdOTb2kStHdPEsA92EWR6xnDz2iqZFP+Jxwm
	5VsH17gjWMxrqiLU9B5QbW4rQABa9NTqB35rOqWRBLLCo1frOL6BdcLCEo+/dqAlPIgavqVVGWbra
	aIPtnj+yxzm57H+ZUW3WoHpl8PpwE4f1gsq5QJ5iOHMjV97aa2ZABsMED+sEaK1pAawdKIyYb7RPK
	35a7JdAZ1dQQvrNzHJCU7B3bhYwEyx2UwZI7TypDqP4oW3hjhoBZFqKgt1tujI20L3X3Z+k6dCcXJ
	BSBZh8nA==;
Received: from localhost ([::1]:47072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbTnu-005H0Q-9l; Wed, 20 May 2020 18:50:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbTnp-005H0J-Ho
 for samba-technical@lists.samba.org; Wed, 20 May 2020 18:50:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id s3so5384396eji.6
 for <samba-technical@lists.samba.org>; Wed, 20 May 2020 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3jens6qXPIZGVi0Ku9XUS4gxDp39ZlgW6NtlhKtjvoY=;
 b=LyGyWus5tW/Md/pdcSgKuG6Zovq/mal8Bi8SIigtxfFqAUqXAPPwOd3XTWGfm9Bv3L
 TuIt8+qYd5w3RxD5yWhDUOCZxvyJ/sNasn1sEyqjmne0FOQlDtbq861MKijZq33mH8Os
 TUzG4mbKG2rTS8L1lQwUbPjkIZmNsJc7OWDEq9tJJ+c9IoZDgWUrdN61r5a5Ol6AypK4
 7RyZsBZl14EJDn8SIuHO6j/vYqXmRRArMvGAcC2h3bhWkNGLQSHuegrLqAiFZdM8bSlC
 E0gCj5/HlYt7KLR/XWcJesViSRLMuPXk9ZNGNo2ppvOuAYDL5lR2UVobqE9DHW9SnA3c
 1GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3jens6qXPIZGVi0Ku9XUS4gxDp39ZlgW6NtlhKtjvoY=;
 b=Shrl9mWJ3hKmL5Xz64J03sjpuBnuaAbHA4Y5L0efUjQ3txQoBf0OzW5Hfn52iismMI
 MELsLal2gOUn7PhRJDIz3a1RLZamNw/JM/VreowP586yuxQCpvjfe4Hj71FS7A8EudkX
 rzs3snWp0l15YWUNBlotLmo3yXiDztQmQRfWNei6Xl1QwgwrUNCPYnmxeqL0jdJjVKcB
 AIUOEfBNQ0W7idh1zciAWE/7QWkmUPyq79mismavVeJ86h1Efp8Zj7dVqA7vzjwPHrpb
 DS3SHwN4uyyYu6kL17PhneY+zogGklhWnyM+Rwjxrq5WbwwRAYbp9rBn34L4k8FcL8br
 k2tA==
X-Gm-Message-State: AOAM530tsbN0o3nj3hYgyHuhkGuyhGwjG2U5cnBwbQPfdKQFDWxNx35B
 3KKntZefXcrBcj56REqhZzsbpX4cGljeveTtFKQH0obq
X-Google-Smtp-Source: ABdhPJxiX+1FDsHnhzRLmyYeP5PSuTDwGgMXxZTZ5lLqrF/Rw3j/wAscfn8Cno7XTkFppznpD2lyL2JgJ854pmpMOn0=
X-Received: by 2002:a17:907:119d:: with SMTP id
 uz29mr409692ejb.281.1590000652724; 
 Wed, 20 May 2020 11:50:52 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 20 May 2020 21:46:02 +0300
Message-ID: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
Subject: Why use TDB and LMDB?
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

I'm still learning Samba and one of the question I haven't figured out yet
is why
Samba uses TDB or LMDB instead of RDBMS like Postgres or MySQL?
