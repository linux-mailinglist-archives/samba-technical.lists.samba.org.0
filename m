Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A31589F
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 06:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hifiVYkHMQIWdyoIIQLzfiZoLds8p0behafJxUf6VSw=; b=XVnljvtrd1aXvnd4OMHt4qTnqY
	RaFnI+snI+sGjpUAktUgLNgbzQCgT/nDsvIqhClQiCzd7kDpS18nCa6t/PnjfcwhTGzd7wJVufXAM
	GDI+z1rwKP+YP15cGE/44GYnGghIHmjv2WDPNvxNNpTTDLhWsNjANfJE6wnreyyrrJpmhwp7MvERX
	LYzZpXL+gp25F4eP3GqRurQI878jATLf9OoaxkwDwx8a2loUQ58VSPfK+D1QB0RMZBrb4hlFduRMs
	ohyTk1yi5+6NArm6rSCDMx6roKrUSHr7mHEO5PR8OKyNGjV10sjzlvkN+2jamCMOlhxDSCqa71oiO
	1E+j+P4A==;
Received: from localhost ([::1]:45106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNs2e-002p7H-E2; Tue, 07 May 2019 04:49:24 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46378) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNs2Z-002p7A-QO
 for samba-technical@lists.samba.org; Tue, 07 May 2019 04:49:22 +0000
Received: by mail-oi1-x242.google.com with SMTP id a7so6127212oie.13
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 21:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hifiVYkHMQIWdyoIIQLzfiZoLds8p0behafJxUf6VSw=;
 b=aAv3eeWS99b/J4TWT7MQa+JgjfSTjhr3CADJr9WRaCd8rM5o3pWpoCzm3cuPERTp1U
 zcRxa9fiqM4Kl7Bsj39DsxDRfdlXqMrF0GRgqadw93r8GH9aD/2Clv+7N5K1JMeXe2BH
 jnaRi1joyQgtFhm5uVy7IBCZraTWv4DmBv+9d+QrLfa8dJMnq4lJqquIljYvckPiduWS
 HJ4sx7CvMyFlbVlVPt8DBtaWxO7IWSrNxhyxicwg4/HIvlR28pMgb6cZ17YbluyfIwxc
 UyAaK/Q0xDpqycK0e+WwYVdBvK8ctY5KaCOLr4BB76Lo+MLTj/VmRYrVxQekTT9U1c6e
 o4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hifiVYkHMQIWdyoIIQLzfiZoLds8p0behafJxUf6VSw=;
 b=Y+F/Hv/wC7n40pFPShqC6djLl8/r0bN1BKgD1D4/rtuvq4Xq4yC3mbWdzF+il8UdXy
 l/4rMlBOcfGjbj7nwTbKhH7qIJ/hEFZRF6Xz1PvsPVF0cUORR5O54zf3Fi+Sm4lA7Os/
 l9byG+QQQ+BxZaSzyh3RaDnMgZNFT9k+e5efNLkNbfB0BKVw8ys/CuunZHmALxCF+rqd
 mdGeOW7SFMV2dF1kLDdZIAi4bIPREKiIky0mvaNvWAbVW8kAXlLrPLyX85KEgRNWWWY5
 V9kiVWEAA6ZuGt1H5POzC//lKRuV23WJI3JO2DPAE02mgPpa4rFPIkkf+ZV6VMkwZt7N
 N2zQ==
X-Gm-Message-State: APjAAAVLvgrbrOANSb0YqUZk1tcC7X4hRIKIawtCJREKvQHW8b7M1A0F
 Z4R8eDRiPGeXtRR4Kwy4k3HbOTFdf/2SFYd3jHqtkw==
X-Google-Smtp-Source: APXvYqwclLQAaJD9nBp/O4LMX14uXB6Lq486VBPwpvW3SXqtp/PBy5LMHoeyACiAF8Vq9ELsBcRvNA1OOBRda09EJvI=
X-Received: by 2002:aca:5050:: with SMTP id e77mr1136120oib.31.1557204557389; 
 Mon, 06 May 2019 21:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190502204052.4147c589@martins.ozlabs.org>
In-Reply-To: <20190502204052.4147c589@martins.ozlabs.org>
Date: Tue, 7 May 2019 14:49:06 +1000
Message-ID: <CAJ+X7mR5-AQkQ0MDL6kNsXo7dOL-cZ3iSWhtZueQsKHwYzJ84A@mail.gmail.com>
Subject: Re: [PATCH] Add logging of ctdbd CPU utilisation
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

On Thu, May 2, 2019 at 8:41 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> There have been situations where ctdbd spins at 100% of a CPU thread
> due to heavy contention for records.  However, without performance
> logs this can't be diagnosed.
>
> This patch will make ctdbd log CPU utilisation when it exceeds 90%.
>
> Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

