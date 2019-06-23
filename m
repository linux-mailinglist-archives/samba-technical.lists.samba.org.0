Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33C4FDFF
	for <lists+samba-technical@lfdr.de>; Sun, 23 Jun 2019 22:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JNsVk+PoVxv/xvXeURpk8PxzJAf5IHyq/NLRYqAr0tU=; b=f2q2RnA/buV9Sgut4HhydhwII/
	jzCxyHAYEOzjUqtSBbybxfQY8B2iOzc8Wp6Q/UH6nx1pRwxN6gPzsbFJ48e8k65PSkOSFK5OWG26X
	UvHJUrcLJ4oXZpmzHA0QFBMlFhFgOnEwwASHze5V/FFQBqVSyECrqzCEDjL7UHf2iRVVkeCy98a12
	xVv/p/RxgGvPz4yveFred1iCURzAzccep+eqLgcRI+7OIRMYnqpZHw+9kXDMDBnLw8vr1y9fGtKNH
	7gl/XiG+H6dR4t9+d00IEDWKFt4+Rzb6fiBZf4WmKIv303Jpdjyvy2W0JgvX2IHPd/3OeAnutP5X8
	oYcb+sgg==;
Received: from localhost ([::1]:54284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hf963-001JVp-5G; Sun, 23 Jun 2019 20:28:19 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:47079) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hf95z-001JVi-3I
 for samba-technical@lists.samba.org; Sun, 23 Jun 2019 20:28:17 +0000
Received: by mail-lj1-x22c.google.com with SMTP id v24so10516267ljg.13
 for <samba-technical@lists.samba.org>; Sun, 23 Jun 2019 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pBaEeT3o4yIlY+tlMK+IAA24fbRDLcCAwHL2f6CuIos=;
 b=N29KyTK+Q4uxh9tC5n29QwsjlPEwAk/Xo8upZiQ0MAXUdGxHzoS4UjgvYMggLo8pY9
 MKNVpRwzDLUB+Na/oA0JyXeYI79RT9CaQlIz37E/hQltbm+Aw8HGkFJiDumNVIARS6jr
 qFqvhCSn1f++lruS/dUJsHn5SGTT8hrj5P88gdr2b7H8y+ZGjzwQ2ahkXnBYXWd1RzO9
 NXp4SXsxG9nt4Y9AIkgaSCliYOKSLhAQlcjWU5SpLoAvpESm1XRIGi/crBejIx9JKhEk
 g/PKrWVU/8vuc+IDAuL19hsRI4opGhDtlG0dW9NTtT16IADxmVaybiQjD21s88c/3sm8
 mPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pBaEeT3o4yIlY+tlMK+IAA24fbRDLcCAwHL2f6CuIos=;
 b=eTdnDT2Q06ZYmdT9+vErtDkAGbyDcyQsH8FIiAyDGE3b8C8H3f+Z1S4/mSdSENgJ+z
 rTEyZeZG9Ysf0rRXDPRM0dzfxXWXtNDZjBUUmXKsN3vAiE36fTYFODKk2OVsnoZDfMZr
 cH10TYTwDvDLsuv9dcTikoqjyzXlPcAfcKvqbkMJchO2D3K2uuPB1mK4w3DEwer9IzOS
 8ETXL7TZS9PKiZSAIXGo8lP3QCBqlN364+hAtw+HXHlRKSQRbwcbZCsX3344htC+4ZW2
 /JvjWk9GOO70tKjKWI+hrpJOMjiC+va5dm8GTechi2alFpg6/Z7JT7cJoDlw6Ry4nBOi
 gRNQ==
X-Gm-Message-State: APjAAAWoYT2UkcuUOyo5I6XvZOSjnAL94lAoW4RBBNE/Q5FOHwV+glCh
 B5Nfek0V653Gg3g29pXqQoI2osWr1oN7fU/xegl8qru7yhs=
X-Google-Smtp-Source: APXvYqz3z59KlSrN9+fYSCsGmh/Y1rNmHdRh2wyoZ90eH77PFUZZZrDjx43na52u+mYUQ/UjEM1cjIwzilfdfDDj0To=
X-Received: by 2002:a2e:654d:: with SMTP id z74mr64110003ljb.111.1561321692697; 
 Sun, 23 Jun 2019 13:28:12 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 23 Jun 2019 21:27:28 +0100
Message-ID: <CAELK94fKWJbPPWD9+jFzvW9tr1yN-JFry0FreqTbAshMU_Dhxw@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp - Week 1 & 2
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, a summary of my activities since the beginning :
Week 2 :
- Set up IDE : I'll using spacemacs with python layer and a few others
useful layers
- Read documentation about curses with python and practice with some sample
codes
- set up local repository with remote origin and upstream and a branch
corresponding to the feature I'll be working on the next week : highlight
diffs.
Week 1 :
- set up test environnement : compile samba from source (with mentor
guidance) and test capture with smbcmp.

-- 
https://github.com/RMPR
