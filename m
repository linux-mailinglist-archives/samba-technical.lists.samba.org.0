Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D35BE32CBD3
	for <lists+samba-technical@lfdr.de>; Thu,  4 Mar 2021 06:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dgjInoQ0bfgqnkl8IiOlTO6sign1x1Mq20NezfFtN84=; b=4Ru5YDWbiWXsMMxrKXg/zgN+l0
	/t+wD4tOCS5IiJ4rMk1YxcKwNGlK1HyJs8jyp/yfspC/VMguBMpKOJuNC/o3wfQuLT6MPU2hVDzAu
	Gqpp3gk8y4TNh796YlDWJDWSP5LO2knu0oJpJ4UHfuP4V0xPXQAm0bnYa6Mw3A25CTnZAnCmWW8kx
	JPHSO/C/q/p0SqcsyFjyw9dEhhXaYBqVEczRpK5mPoXq1l3wiYVtbUhipCxVz3stDx4PzGWOQOIgs
	b+WazYdOeOQ9xQjDUgZY6gDH3muP9y+CMREqbQxqjSmiMkSIkr8lda2PrSUx7KxTwuQPBLXJDXoaq
	wMXJVz0A==;
Received: from ip6-localhost ([::1]:20782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHgSe-0047rR-9V; Thu, 04 Mar 2021 05:23:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:36027) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHgSW-0047rJ-9s
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 05:23:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id f1so41117387lfu.3
 for <samba-technical@lists.samba.org>; Wed, 03 Mar 2021 21:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=CQIdpmlV4tDkaOGLKQKVPKbsU9O1GKKuc8ghQqDYebs=;
 b=RLqHUBUiLV3+zvCF2Zzy6Fk9brbVNn6Dw/+JlGGQTyljZ+vI11II43Xcvde1gURXla
 hxgemsQovnPdozc2E+1FUE8M2xKY102wTPYtHol+sc1rQgBglM/1BTlDkexsfq3ss7tN
 fvvzaFt2GxGXa4xQHexsrc3cNWCSEXnP/57RNhTVApyoDsFG3vSEX7f+tHzsYPtkEOcj
 9WXLS/ZtY/FVCv4zQzHtC66Bgu0fEmvSMO+N3jeHUm3R+UMJOAfW1Ui1bf36QKeofrdH
 Hj+CdEYzqJPx6/z9wm8p/1pCizy+HAxjjVf8FCqBXOtRmvE/XZPqqEYGmaR7WlPkWRhi
 uhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=CQIdpmlV4tDkaOGLKQKVPKbsU9O1GKKuc8ghQqDYebs=;
 b=ikg5h3N6LILK9yfkyTVt7IIt++L2V5NXAx+RyXh+PjZp+5dfuV9LgNPnbP5Fym2lcH
 0lJvE4ikAG07EB6/1987AXUl9UEWl3HxkDa3lwcpllrxmJYIBGzHupwxUDyAfJyMpuu3
 aNc0Q6UbRES/dKR92qyDZj8KIHDu/VVhVv75o2jo53n7coaMLttskE15kTQX1mzosCSx
 8Q+j9znNtbBdpFlqKVtdN8y+Nj9NyceyjSHbB+UjQkFlMaixY8QBq53ueMP7+7sH3rTY
 5wJIQmxHvxIDG3htg2Ht1cnqefRt5DUy4SMkyvnd7OLv5gval1ckhUh6+BrN14WAmfuX
 sgoA==
X-Gm-Message-State: AOAM532mDH8KWxiSutpkRzH+7JC+HgqQ/GzR3XkxfhieOCt6N2pD6BaH
 M80nlIipuzduEBOp9We/3fG/OrZmX/M4FKkN5atxfmlu47A=
X-Google-Smtp-Source: ABdhPJweoHkW/Ou6IqAKj5Qa5arsOizMK3XHD/u3aFWdttTNFg/lfmRsxlfa5y3RFQiYNATfi9023o/wkPRA40Eg878=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr1315227lfh.60.1614835411243;
 Wed, 03 Mar 2021 21:23:31 -0800 (PST)
MIME-Version: 1.0
References: <CAH_vq2FryOcCDD2n7_A-J_HDXfMVO16XE0aXGMfpjeW8oDsVBQ@mail.gmail.com>
In-Reply-To: <CAH_vq2FryOcCDD2n7_A-J_HDXfMVO16XE0aXGMfpjeW8oDsVBQ@mail.gmail.com>
Date: Thu, 4 Mar 2021 10:53:20 +0530
Message-ID: <CAH_vq2EvPYioHD=eNpqeC=mGT0UuXBxmCx_YOd1tByPZeG9EWA@mail.gmail.com>
Subject: Re: Kerberos support on Samba
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Any further clarification would be appreciated.

On Wed, 3 Mar, 2021, 8:57 pm Vikram Bharti, <vikrambharti33@gmail.com>
wrote:

> Hi,
>
> Was going through this.
>
> https://github.com/samba-team/samba/blob/master/source3/include/libsmbclient.h
>
> And I found that we do support Kerberos.  Please correct my understanding
>
>
> Assumption 1:- does this mean if a user x has permission on SMB share then
> he can access SMB shares by sending credentials to callback API and Samba
> can use those tokens to forward it to SMB shares and provide the access?
> What i understand from t*estBrowse *example , just enable the Kerberos
> flag and pass the user credential to call back function. Which
> internally uses Kinit to pass the credentials and get TGT and TGS
> exchanged. And then libsmbclient forward the request to SMB shares with
> TGS received and initiate TCP session.
>
>
>
> Assumption 2:- it's only possible to get the token for the service account
> set up for a computer account as mentioned below.
>
> Setspn -s http/<computer-name>.<domain-name> <domain-user-account>
> RegardsVikram
>
>
>
> <https://github.com/samba-team/samba/blob/master/source3/include/libsmbclient.h>
>
>
>
