Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBC319A53
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 08:31:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=H+TRCnudhS9zTy93NyG+pH33RMcN5mbB7CYxZTfu3V0=; b=lr9VG9lfOLxh6/BF+Do7N+a+m7
	bsMdoDyKBsYMyOBVAM5nL+yOKHMRlZ0zH13VM8cy/kKA3iOPZfBq8vEGgsY+ljswRbHUzEkubsPi7
	oRUtSvXvRaKchcILYlPtmu6BOZC+QkQ/7A9FYQWkatdgQ8CBZ7Wwx/lh+kPXFvGDhmhuskDpwnOki
	c6MeAwYiFCtcn4c5s++qbCXHgsDiU5chVLrgL5oq6yFUxekZRoOxIkTlA6/W5VUtEGqo0nhfYiSLN
	o9du3PDR5F1uI0slp8ugMm18Zm7rf2jDpJFNv2bNCOavYQR11lX+FUmwagG3ZKoygjLxp0Sz0AvYK
	mLx2JSzA==;
Received: from ip6-localhost ([::1]:20606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lASvX-00CMNz-Lv; Fri, 12 Feb 2021 07:31:43 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42869) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lASvS-00CMNs-S1
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 07:31:41 +0000
Received: by mail-ej1-x62b.google.com with SMTP id z19so765970eju.9
 for <samba-technical@lists.samba.org>; Thu, 11 Feb 2021 23:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FR5HEgiHeOWWI2D8pFrR2OHOeDhO077SdDDcMhQcCXs=;
 b=ibhdeW21rym85q2ugPUms6SmkGshhfsZZqAMWjzfXej+x4llqmvjs9TsOPsr8QCD4j
 RCg85ihKt5coFqAR/fAm3qqo0iha7yEZq0hsnvUIj8VF7EMunyItZXEjYZ/gnB4CzceV
 1Z5rZD4Oppl6jrgGUEXbZcxU+IAb9ehmfQUYBj4jqqje++27hcc7OOxUuReVqQ91Z0jx
 7cR68SauI+ADDmlt3c6QpGjY1YZIvSmpb68s1aaRSD85coCY3uRUCBeEwoV/8+3KCcQm
 eFQ9JY9pTo23C7LNLR8XzTrE3hcpHIeAQSjpzN5ltR/DxxKFlJXK82YciuTsT2CmDkJ/
 uOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FR5HEgiHeOWWI2D8pFrR2OHOeDhO077SdDDcMhQcCXs=;
 b=mkneb/GRY5qdzaPk7YGdb0mq4VNi2L8VT50kbSFl6wvbFuwPdjoRYbDcrXFKCiFBS5
 9z6IdMpLc+CoNYOlI1hfONFY5eFx/paQyr3YbeVkEQb9y6+cRr0ejEeeSSv3aCSVoym8
 Pco/Qk4S65G9boki889ZU/mC/Mf6vPH4Dk79oZLc9EeHadBF6BI2kek52uZbJsLKUWNH
 /mGRK87WqKNTQjVsFlEXwyaZVrm5bOn9RIAlG7C8yT3hQlafAgSOblAhGJGXm/yyK9f5
 BEmFr2d10znaDqD/A4dqKrLG82VFhx3t36EYdPHOTXWWz2VURjLD2AhK7aTLltjHakAN
 p4Ew==
X-Gm-Message-State: AOAM531hRkACdqX2ncOs9br8SzOUn0WEWwswHb/Dw/839W7JrGJqygkx
 mv3ik7wNxU6Ye2cBaKgxXtZ7Rr8FnQXtgNkZz4M=
X-Google-Smtp-Source: ABdhPJxepu7NjWpK0PxQBQ0eNtt1MqY+SLR5DPRCPzQntI8XUDbO02/z8GONTbcbyqKttTubBrSO0PO7Lb6eNssaavI=
X-Received: by 2002:a17:907:b16:: with SMTP id
 h22mr1637188ejl.393.1613115096947; 
 Thu, 11 Feb 2021 23:31:36 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
In-Reply-To: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
Date: Thu, 11 Feb 2021 23:31:25 -0800
Message-ID: <CAMYxiYzLw9crMctaEhrvQ-4i=Z3X4OCxoWWW8K=WS2gQt-Qirw@mail.gmail.com>
Subject: Re: Building Samba 4.14 on CentOS 8.0 and gnutls
To: Richard Sharpe <realrichardsharpe@gmail.com>
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
From: David Rivera via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Rivera <rivera.david87@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Richard,

Did you install all package dependencies listed in the following wiki
page?:
https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Sam=
ba

-David

On Thu, Feb 11, 2021, 19:03 Richard Sharpe via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi folks,
>
> I am slowly getting Samba to build.
>
> The latest problem I hit is this:
>
> -------------------
> Checking compiler accepts ['-Wno-error=3Dunused-result']
>                          : yes
> Using in-tree heimdal kerberos defines
> Checking for GnuTLS >=3D 3.4.7
>                          : not found
> ---------------------
>
> However, what was required was not gnutls (which was already
> installed) but gnutls-devel.
>
> How can this be fixed?
>
> --
> Regards,
> Richard Sharpe
> (=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
>
>
