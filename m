Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 787568CF16
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 11:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Yj/wEO+s1U6knCJJsvgl6ASLXOJdEeNdXSrGRD1QZJg=; b=QePueOt7/9yuZRY8VpzED2gWT4
	FdbSeLMAOfcO985q922aXrbIjKKdzvDzGOsIgzydYYL0ECYG9IFT+gUt6/5u5DbfQvJLsmPPStfsd
	X+RP08Gv7a045Ovos93DeOGKt3twxV1K08rMZIq5UDA2Xym3ExylqLBxb/KmBx0lQvp+ZZIHuNUuh
	8ZuthFTlKxFRX3fRnKtkCmlZ+PmruAzZI1YaIlxfNQcUYIPG7BxhAkNhar+7aI+7YBDnMp1l0hfnZ
	iRBIoujB8FwgnSGDQwcJlVvqMI7VX0LR7ozGs+NUYYSJDpaSH89HTrjM0FW5pwmsiipwsuJZiQM2f
	aANjQf1Q==;
Received: from localhost ([::1]:49514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxpJZ-006Fzc-3E; Wed, 14 Aug 2019 09:11:29 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxpJV-006FzV-7h
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 09:11:27 +0000
Received: by mail-ot1-x342.google.com with SMTP id g17so29711719otl.2
 for <samba-technical@lists.samba.org>; Wed, 14 Aug 2019 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yj/wEO+s1U6knCJJsvgl6ASLXOJdEeNdXSrGRD1QZJg=;
 b=EzH4+g1KC5N00GYzTNNE1sFT1ye4IYggvaGwTOd72Lvm+0KNtAInR7TJBTGPqwyWS/
 thRkkCkMWSs8C0xn5gIBxFRhNzI9Q521d1xxSljiJQyfTF+CjYUJT+vBs9GmS8My4Z5N
 0mruQCpRtSCSLrCcpHzcYNeA+ORo4bycGIdf8aghyickpxngdISDJRdgIcT5oR8KsAJm
 QenZ1E7/x1nJteeq/TP2IefDMc66ht4JwCelroe0rsek16L28EQxepYdHw3lodcFdRoE
 UpW6Y3JFZv0opGYymYHtZQW6oTkTZQGKzViUAo4taki+5s9UkjwDNPcrYiXBUk86Gwba
 kmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yj/wEO+s1U6knCJJsvgl6ASLXOJdEeNdXSrGRD1QZJg=;
 b=IK6PO1aDnyQ1m/maROkazGitKfW2z+sYlYynsf8hk8D7SziZ2uNylgkhxJo1REdRPh
 sa9Z5eTUYLkSMrB19fXcdH0tdnRdwcpn1LLVPHWLT3LVC4J+vR9DZtnbj3Ta5/gqhv0i
 GPZ0nLztftcOAwg1mn82MylSYX2t3/ksqVWDarT1jUhZ+UTxjWbD9QaQVHL3bi2ldQbw
 uR1pmhF04SvVUKdJ9Kg/IAEJl21Oavr/fgWkkNjk+1khs4HD6OI7QS9Dt5QLcVWaKwgm
 P1ER+tiA1HfsyKBu/mAh/TXCoQ11v+XOr9qgjxQxMMy/EKpbPx5TBNoT8h2MxfFiixGu
 EFWg==
X-Gm-Message-State: APjAAAVKe+ypj0CU7qwzIKhSVS/IXwF6aEvlujASpQgqQ21ZxPTxCfcc
 QWL1J2QjV29bd7+KF0YN9eqSG2Sr+V5yR7PC7gY=
X-Google-Smtp-Source: APXvYqyw92ZL3IgoRuPpWKtsrgyYblXTYtIwqXhJMIrKtN9pAd2Dyi1lUWfFRRv2z5QCdUsZSUnXHr4FxtinBjbWj5g=
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr38824818otr.232.1565773883291; 
 Wed, 14 Aug 2019 02:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190814140428.5e71c1a4@martins.ozlabs.org>
In-Reply-To: <20190814140428.5e71c1a4@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 19:11:12 +1000
Message-ID: <CAJ+X7mSJfgUza7kpdZVuPLHNxgyRrACH-kfVQ=KaVV26dHkZ+A@mail.gmail.com>
Subject: Re: [PATCH] The last of the easy CTDB csbuild fixups
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 2:05 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> This is probably the last of the completely trivial csbuild fixups for
> CTDB.  Others will require a bit more thought.
>
> Included in this pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

