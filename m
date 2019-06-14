Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D245CF2
	for <lists+samba-technical@lfdr.de>; Fri, 14 Jun 2019 14:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rXvOXp3qZLj3YCOA4b8/v+0p9frTSCpaDOcHnqgMe/g=; b=Bio+sXy6sFoi3S5DxjhOkqnCm7
	4AIRuw/aFNIcf7jiLefmaRWYaY2GnC+RyXdzswgJC8ngdCnvFA/pWI6txIMrfOFmTVWFX9q6fnouh
	q8AvuqIZar1ugwzBw61EyTajSI8wRgfzRASrDkUOPKGjB55LAzFMIE+TFKsP1N8EjCCcC/eYqhRKT
	LM6Bom8GnNtexeuzXPuVUT+AP/5jNeZAWidMeTynxUScqGFH09Zj4CZCyeFEXdK/3XOjKCIaNbn/I
	DdlWNmvGD+CXExQF/SF7YhstH/UQL5w2dM25rnaJnEZIUWa/wl4p9aqXHfFMFLhWsM1g4n8Y9RhZw
	ZLC0jT4Q==;
Received: from localhost ([::1]:20144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hblSK-000HlI-DN; Fri, 14 Jun 2019 12:37:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:41149) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hblSF-000Hjs-1I
 for samba-technical@lists.samba.org; Fri, 14 Jun 2019 12:37:17 +0000
Received: by mail-lj1-x22f.google.com with SMTP id s21so2224007lji.8
 for <samba-technical@lists.samba.org>; Fri, 14 Jun 2019 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandsconsulting.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91em2ls5DNKhbOMb42aPIVi8meb6LHAIMgfADxhKAwI=;
 b=Ia3vlGkiOny4+aEkdLmwDP1HwXLD//5aN90i3SaIe3ChxW2EdjyW3KJclX+jsGSXxX
 8XDZFwIHN2feVjGaNHfglFt98g+U8yrRw1IL7Pcv3f3nSz6UoNvoC04EGvZXKrYooJJG
 XCDgaLJ1XVv9S6D6UVcboMmubq6kzGdODRGVTcjh8pr17pvYsdq3uJAAeWe3PvlucvN9
 s36ICxkqKexyN9+lusxwsFkV8YLf547zykKl4VnjQARCAeAWSurvtA7HR4l8kT6vV1CT
 s3m5hjpOMdUP5BzVGCAGSnIoFzeWi25SA/ioPynIOMa6d1psQbUDeapC8le7K0Z6SOpq
 bL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91em2ls5DNKhbOMb42aPIVi8meb6LHAIMgfADxhKAwI=;
 b=NBMUbvhwOlZxjKt+34rZqUEYoevyEa2SfiyLjS3wEy6ssNKg00VG6bJtbTrci3qJKG
 /Es2qR1iobVTToryTJYjiWLqpQUbBVZ4dlBfluUxa49sc9HAh3FcYMKjlHx2jDsFT2Fb
 6/CZBjjBbhsscTFwk7UsU46hBdgLytKhopurzsB/RX0qtdmDSWP7jhBuWS6ZMnigY6o5
 aVvM78MlTDSPRwH8ZK5guDBOhBH1ZbAHvuDcwKgViP6dq43Zs0Is9nwwiepWN65TVv/f
 rarCzffv0UHs20Ce94k9P0oSiJMC8NYaM8t7qZrtgyS1JCVW2/NIkeGzAwplvS+tJh8o
 cIZg==
X-Gm-Message-State: APjAAAXXUxCSO8ODkdn62AiNvCNU34acyW9T40hkbhHLdZ+EDcsDULlq
 vqnRGp8h15wofB7HdMbuWV/HShn1yZzSMIjupyegYBbd
X-Google-Smtp-Source: APXvYqwzsaAgjiAYUjB124hMcPVjozeE4jN368AkxAg5ZBwvWKWjc6PYPXqbN0XqKAjLf/blmNl16+jcwS1f/iVG8GE=
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr26646621ljl.21.1560515833881; 
 Fri, 14 Jun 2019 05:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPKK0PPaLLXnh5Gu-EHeUGcKkATp4rva4LzcnhCU3SsACMyb4w@mail.gmail.com>
 <CAPKK0PPxz7RSLqE4NOmXah6_qvpbwM37XwxYOX035QQ9mi3XGg@mail.gmail.com>
 <52115dfa88ecbb8f13436cdf8d6641d0cda4728d.camel@samba.org>
 <CAPKK0PPpCM9AELyFhCq87pRcE4oO_oTTdYh_UZGnxEL7z-4Z3g@mail.gmail.com>
 <54ca8de2-af44-0946-a620-4614379db895@sernet.de>
In-Reply-To: <54ca8de2-af44-0946-a620-4614379db895@sernet.de>
Date: Fri, 14 Jun 2019 08:37:01 -0400
Message-ID: <CAPKK0PN3SLLwX74F+1YPzi0mZ9w=+dF3SSChNpM+23RNpziTgA@mail.gmail.com>
Subject: Re: ChangeLog
To: bb@sernet.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve Cook via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve Cook <steve.cook@mandsconsulting.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

How does the initial setup work?

I found this site, which has a script.

https://dev.tranquil.it/wiki/SAMBA_-_Synchronisation_des_mots_de_passe_entr=
e_un_Samba4_et_une_OpenLDAP

Is this accurate still?  How does the initial password get put in the
virtualSSHA attribute as an encrypted GPG string?

The script looks like it fires once per user?  Is this in real time when
the password is changed?

Thank you
Steve



On Fri, Jun 14, 2019, 6:53 AM Bj=C3=B6rn Baumbach <bb@sernet.de> wrote:

> Hi Steve,
>
> On 6/12/19 11:18 PM, Steve Cook via samba-technical wrote:
> > So that tool will fire off on an individual user change password?
>
> the syncpasswords command can run a service. This service can trigger a
> script on an individual users password changes.
>
>   --script=3D/path/to/syncpasswords.script
>     Script that is called for each password change
>
> For a detailed description you can call
>
> samba-tool user syncpasswords --help
>
> Best regards,
> Bj=C3=B6rn
>
> --
> SerNet GmbH, Bahnhofsallee 1b, 37081 G=C3=B6ttingen
> phone: 0551-370000-0, mailto:kontakt@sernet.de
> Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
> AG G=C3=B6ttingen: HR-B 2816 - http://www.sernet.de
>
