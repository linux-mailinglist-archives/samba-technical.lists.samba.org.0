Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DE7B5849
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 00:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XOtTja6+Wj2nySXvBiJnl1fni5sDDLki3X3m8dFJXBA=; b=PszB1KugZ15P08Yxv55dd5+Gd4
	f5Zk6gTmT/UU5U5bKHDcAQMU+X5vYIMylrsbRIeUG+wwAKvath0vhGIbNf6hKiy3RyV7DgO6vOm6G
	/26QuJnGOwksYuCzsSWtOeYg/YYBFGMy+pEI4vYJysrf5+VrZmBudjytVZkbiQ8PwhKgdxiqByXWU
	snczHLzRPyzYK4hEJ70WeD9lDX94MQl3avhViX8VDjVEwMXBWksiSKB/iqCDFxtLowykSQQrJBDcj
	Fj8R3id8u8pKFH7L4u8H8fK8WOWSIJxoTU9d6H3YE/qtEILo13vLUUdsHg1GpvhNUBLLp6cmarFJV
	a6+Ailug==;
Received: from localhost ([::1]:27410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAMNa-006LIW-4c; Tue, 17 Sep 2019 22:55:26 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:33671) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAMNM-006LHN-Fd
 for samba-technical@lists.samba.org; Tue, 17 Sep 2019 22:55:15 +0000
Received: by mail-vs1-xe35.google.com with SMTP id p13so3238800vso.0
 for <samba-technical@lists.samba.org>; Tue, 17 Sep 2019 15:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XOtTja6+Wj2nySXvBiJnl1fni5sDDLki3X3m8dFJXBA=;
 b=XiuuP5SoQLkwdZ7QU0eN3aLAlxf7DwqAEa4+GFIwkDpvqfnOBPzh34M+72LTq2n4rF
 z9P3SKGLSXpPBdyWxFFemNo6hC+PlOkNj0xrmj+WAg9PBzwf0Rlb436ZKr+xy6bc1y4P
 krkg+0VDYdhOMGEW+8WWD7fhtbdJkkadjOENgPErsp2CIshkd8/RmT6skFvFCYmGJFfA
 cx430uOXuI8ZDchnYtamtamKqnR9tBM7UbIV7omX987HLtCUy921grBoJIw3fw5qFqAc
 2eHU6iZ4OQuMmjBrV7szbEF9dUJJedDyoDLENMWAUVQDCssRF+IMz/dpcJDQE81yT5SP
 Vpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XOtTja6+Wj2nySXvBiJnl1fni5sDDLki3X3m8dFJXBA=;
 b=sJDPwDaECjj2hznPogeZeV9QPCu8wIpy+KqKt7rwGfgAIhfW0p69VD2OyUWhIsfdUW
 SaoM73sJwZQJX33nWkhOkfeMOcAcGni003QdM3wring9KYvBpcjRbYABnqE/tOpg0HFf
 zCEz6oSIoGj6MK27s9YVM0wINS+OSW/MkI+70t5Z2rY2bfWWWnhVlDBhcpX8QbcpwfhN
 InOnW1De7BvP3zP3hncOjCdMEJ0JPcN59MHZKd66qiCVAcUZR3tHXHVOjCqkDIdaeD8L
 H9fex282hUxJ5/X3uiFg8ZIQZDRjoFjqBmGO08S3mKp1sDPD5gaKQhMU/N1qaDH2AgSx
 uWag==
X-Gm-Message-State: APjAAAV2hH4VHZ4hqV+3wotdisgQmAAMkbnXL4GhMnA+uVtBHh5cZEcD
 bRuYL8+MJdN2tUxfanuQmpxV6vNoIncTKvDRQ/I=
X-Google-Smtp-Source: APXvYqxiSo+0wN+CZsy3d1s8DMuBXvwAHFElOUELZHce0EU06Xg85hg8tUzZSwD6rWXQu1mCfdKLXnDSnNYmdaYu17g=
X-Received: by 2002:a67:e447:: with SMTP id n7mr583595vsm.66.1568760909325;
 Tue, 17 Sep 2019 15:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <43d2884c-c637-a028-2f17-9857483a11b4@samba.org>
In-Reply-To: <43d2884c-c637-a028-2f17-9857483a11b4@samba.org>
Date: Tue, 17 Sep 2019 18:54:57 -0400
Message-ID: <CAOCN9rx_8eJR-ZgXrH6_zJFNDAOfoio+2Y89-QT_ZyCE0jcz5A@mail.gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.1
To: Karolin Seeger <kseeger@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 17, 2019 at 5:16 AM Karolin Seeger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> Samba 4.11.1 is scheduled for Tuesday, October 29 2019.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
> has been updated accordingly.
>
> Cheers,
> Karolin

Will the experimental support for mit-krb5 be considered stable enough
for production use? The Fedora "rawhide" copies of Samba activate
that, rather than compiling Heimdal.

