Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D63B8BE7
	for <lists+samba-technical@lfdr.de>; Thu,  1 Jul 2021 04:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=THjZxLGMhk79jO58C7Xn1Kq2DYZGlYwNy03XCBiW0Co=; b=wMpn5kZFQ+Cr19HjmiP6QnNGWs
	zm8pye555Ibk6AzVplYrQb0UBJpqLgKeC6e/ipNoKI81wSUlBacfKskXHc0nEGrm1bAOmH9co/9b/
	sbaMUpWNBs1sP4CZL45RvWKE3x96Owe6KakIikYsSgSJ9ZSiavQIs8co+uQIqhRF69QAFLfXvWeAd
	7PTcI6FTyek/IQL/2Pe0o0LlRhRk7lTnL1VugdTXw7/Hqy6ee5e19vbDmjsHlLrnX0qAJy8+fAWzn
	pWCZntQJllmn40l+UIYZHJ8rUzTZe2c65SoM7KRpZS6sva2jWyaT7OQEUgSbIqNIDhfCVzC1IM8GH
	pmmLrDkA==;
Received: from ip6-localhost ([::1]:33650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lym5y-00BN4N-3I; Thu, 01 Jul 2021 02:06:26 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39741) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lym5t-00BN4D-3u
 for samba-technical@lists.samba.org; Thu, 01 Jul 2021 02:06:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id yy20so7679021ejb.6
 for <samba-technical@lists.samba.org>; Wed, 30 Jun 2021 19:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THjZxLGMhk79jO58C7Xn1Kq2DYZGlYwNy03XCBiW0Co=;
 b=KUJgNgQYSr9PQiX47eTyrs1PpU/gWbFUiE09SMTx04bHjZRqyv4a5lKqklXI+wjVdG
 //1+MGDYez5mnNXhIeYF1GRmYT6vB/a+6esThWzuDeMo0xIIUyHt2Y69FCp9AE8lenXV
 GYwq6C2uMqb5SgZDgZEcchMq/zX/mOfKLPO8gGrl+/JWMNbwX6f7LeTjI3uOFFUYbe31
 PO3WOoue8A80RuQowTWOmE1DXhAT5De9dDsD/A+PG+0qLRVRXzVVlYTgdGUApVeRgC53
 PDPYMo2qtpxg6+ZWQiwN1YokJdfsDCg8HPCR/ZOHvJWDXbDxVwU7Oxhrbk1BtI1AIXzO
 vr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THjZxLGMhk79jO58C7Xn1Kq2DYZGlYwNy03XCBiW0Co=;
 b=F9TmscLXh0taUIhSYZoYlw2ywqwljtk5+D6lJrfB+F5zMcxXLEIvqm+Jn17FAWTZGE
 eUgegcVJEtGzHYkvHUWPCAhcuAVEdFGjrPB1V66RZP9NBhJZqkX9C69AsfD17QvogLDE
 YNpLRCF42p+tHlw36yuyykquF0OAShi4Q2LWqQis8EuuhEqqpmKprV45pNNwWwHGmA1T
 5W5uomGKpraSJaItC37ZCw15yq9eON/MJi5NQaWKktUrXhh8xrkrvKUxL2RNsP2LKEqA
 D66feLJZw/RkPJLjP/uQZ+B2AbtJ1tdTf83+AoQNzVrmVuxFW9R0BsJABiYq7LzLn58B
 e8Dw==
X-Gm-Message-State: AOAM5308g8vYGa+2ddRStVOkynXHvRrHQiOOF7ne2xqy44ejaIoS7gW0
 UPbYJtGxchCCEytR70G3REtJrJryLaaazd47mqBWBj3C
X-Google-Smtp-Source: ABdhPJzOpJpg3oB7Ke5sTMUhr4FCcUtFX3xeu7L+PdZTC/WlwaB/zeYJYm7QxkRdJywsDwL4b9fzTQRf7kx6bJhnCAI=
X-Received: by 2002:a17:906:ad8c:: with SMTP id
 la12mr29475480ejb.203.1625105179238; 
 Wed, 30 Jun 2021 19:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
In-Reply-To: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
Date: Thu, 1 Jul 2021 12:06:07 +1000
Message-ID: <CAN05THQbpJQbeRrt-rAF6K0tpnqRi9rRrg8xRxA34d=_Sy9EKQ@mail.gmail.com>
Subject: Re: Given PrintNightmare,
 should spoolss go the way of SMB1: off by default?
To: Andrew Bartlett <abartlet@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 1, 2021 at 11:58 AM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> G'Day all,
>
> It seems the current keep-the-sysadmin-up-at-night is a thing called
> PrintNightmare (CVE-2021-1675):
>
> https://therecord.media/poc-released-for-dangerous-windows-printnightmare-bug/
>
> Hopefully this doesn't read on Samba, nobody really knows the details
> right now, and if you find out please mail the Samba security alias
> with the details of how and we will deal with that confidentially.
>
> But the public question I have is this:  For Samba 4.15, can we set
> 'disable spoolss = true' by default please?
>
> I love printing just as much as any other team member (joke!), but we
> have a lot of juicy code in printing that many use cases don't need.
>
> When the next printing exploit comes our way, it would be nice if like
> SMB1, many of our installs have it turned off already.
>
> What do folks think?

+1

I don't work on that codebase so take my input for what it is or ignore it.
Do people still need/use smb/dcerpc based printers in 2021?

Since it is a huge codebase, that runs as root, where I assume there
is no one actively working on,
and where for end-users there are much better solutions in the last 20
years anyway;

I suggest : disabling it by default sounds like the right thing to do.
And maybe deleting it at a later stage.

regards
ronnie sahlberg

>
> Andrew Bartlett
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>
>

