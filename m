Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA6A19623
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2019 03:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RBZ32BeQinY77bU599WCfh/cyz429fsi1e+WA0BGUKs=; b=gFVbri2maPD46Ft0CqQtajFzGu
	NZqoYY3TzGvwq5DyEO1hPV6T+XwJ9s5B8ND33TByOEKvz291ufxGbaLgRpCW3ZQmpaBuRR7ujYX75
	tL+Aq4nQUPYeNv2V7L4uK6bNMpZXsNO3bN7sXbq/bbeTNQrwemtIojZqWK5sbOO3AVHcrbkQ67YIH
	L0sX9oq5+YUiFNZa5BDm7wVIsle+w62BboRwG13LUYEZ05V+eJ97WDXQJdTCm2LhERnfArLisVPFT
	qYM8xzugEQx/G4NKGqgxlOEi0eK6pHGMt8UZp++tUnN678Un4ex0QjRJgCSgkJBpoU6ixjTjuAQPN
	sbv5mG/w==;
Received: from localhost ([::1]:60364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOuIj-0037OH-7f; Fri, 10 May 2019 01:26:17 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46517) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOuIc-0037OA-Rs
 for samba-technical@lists.samba.org; Fri, 10 May 2019 01:26:13 +0000
Received: by mail-oi1-x242.google.com with SMTP id 203so3356183oid.13
 for <samba-technical@lists.samba.org>; Thu, 09 May 2019 18:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBZ32BeQinY77bU599WCfh/cyz429fsi1e+WA0BGUKs=;
 b=XWXsv9nez5uYoVpCA/HfB7oI4lccWxARcP3EPOvUWsgqys9tAozOqbNojfBmCv8aA5
 kVr2pdIP6X1JuE2jIIP8yWwk3sQgXXrDtB5chs/DQFzw7X0RgSzizg0Nfjh5l35U9yoc
 BJ4beG/N5f1t4cHBHHrmkHwssY3GVclsNTM+sZE2xyt5AiOdrKQ5h0xwYd39/TfS0K4I
 Q8dlWcfulQSHU4R5dE4U4EVm2miOOK7aBSxhirJO+eN2rE7ujc2ovihvsodRow7N8oBN
 rIDXLNrFcOhL9E1obxn8axLUGF9+iepTMAuotgZpO14LKpN13matrYKF9v9kqOyIkclR
 62Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBZ32BeQinY77bU599WCfh/cyz429fsi1e+WA0BGUKs=;
 b=kJxAWhcRwAmXY4hR0bq3oCCq1LYqL+l8E1NzaH+libXVidnDurCLZ9djmj5ED2NrHS
 tYOI1JiEf4Yk6jAHYlgcZbDKWjltzHnRK7Ki4YXV/GmwtFNamqoqUSn7H2ZZFgh9vm2I
 BiscY15H7oW47sgzQzwIFgqjtui+yUYuFpqzBVvGf62gWqe3FToKjvcEGRXU7JZTwy+w
 mblPbs+qoLZtXIfvLEZP2XWJ1DedQqQYNE0F7wECNtf3pyQnWUZdWLKyh414cmuNrXnc
 gdek8SYt5EMAAVenANps5hCoBBPdjVZRojCEqrcEpY5sPlItAd9CY95GntZeZCaDXpXM
 Pv9g==
X-Gm-Message-State: APjAAAXG0xWAZpnw8Pcnbpa9s1B+C8c0SKMy0i5KnTE8TIG8WrhB4rBm
 +vnCiB3scw7yncP9X9Vok/DB4Bp5M3xUEHpjkhn6uw==
X-Google-Smtp-Source: APXvYqxuRRZB4X9PSjQQ+cvOUn5dHqCpQBxzeh7cz6hGT4OGgopWd/K8dI0usa6LP/lalTJy69Y8GjlBF5KxhI6Zj/4=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr3701215oif.140.1557451568257; 
 Thu, 09 May 2019 18:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190508113257.5990023c@martins.ozlabs.org>
In-Reply-To: <20190508113257.5990023c@martins.ozlabs.org>
Date: Fri, 10 May 2019 11:25:57 +1000
Message-ID: <CAJ+X7mSGvLQs9GH20s5Q6=bDcGmQv4wMjsrUrMHbejc054ia7w@mail.gmail.com>
Subject: Re: [PATCH] ctdb-daemon: Never use 0 as a client ID (bug #13930)
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 8, 2019 at 11:33 AM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> ctdb_control_db_attach() and ctdb_control_db_detach() assume that any
> control with client ID 0 comes from another daemon and treat it
> specially.
>
> Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/60261138
> (just started)
>
> Please review and maybe push...

Pushed along with the reqid wrapping test we have written.

Amitay.

