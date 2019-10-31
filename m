Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D97EB9C2
	for <lists+samba-technical@lfdr.de>; Thu, 31 Oct 2019 23:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DMsu+pzAlqXLFqCFHczAJnKB7kERRvXtZgg7glElDEE=; b=Dxcmuez2y/p67uEL4JVHJWfHqh
	FLscOMgfcIFy2vbJ1XYqZo45uJn62qphRDhDEN6r+dPqh/GY7CEbb6flreiX/lZAFue2LPXAD52/k
	eDT9PVMxKqN93B9XVPlRoUjb6KJ8cAjLCL8xXMaHWAc+qAjvlWjPZwh5cyPCIuhcKdBrZvnHjOR8Z
	/ATfT+CxY7fEAOiHLPftddF4HZl1JO05etHHm3IjE4f2MvvGl0NjNDM9Qb4aDZOf12JEA9N9n1Iwk
	3c+4kjzozbg1swiEGCFRm4iR7aBQapxYt1MysYzL3tiIvj1tVYORCLCjtZ2eBVfWsUmSMfghz+wIc
	7Tynq+Ww==;
Received: from localhost ([::1]:54856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQJ5o-0044zH-Lf; Thu, 31 Oct 2019 22:39:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:36198) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQJ5l-0044z8-3Q
 for samba-technical@lists.samba.org; Thu, 31 Oct 2019 22:38:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id a6so2503801lfo.3
 for <samba-technical@lists.samba.org>; Thu, 31 Oct 2019 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DMsu+pzAlqXLFqCFHczAJnKB7kERRvXtZgg7glElDEE=;
 b=NEZIVVJcOEyp+FmstITkLUPvzz9/amNUR4Eb+sTJTAU/6h9jcva0x8v7wuRfSzwIjh
 29vRZFNvd0kagZ92Uca7GefZgSX536LI4zoGenuOWd/hcg39WfrKhc0JHhXrjr567IHm
 YEaPttYRkiBUrhjmF9WmZ5egmPrFiJHSR1a+NbqaKAZ0L8bIRhTdLz/WPfgIyQ7C0l16
 heKNRoTCVJl/173+aJbBzTFMiBMDd8wvyVp/t45BKJsOADZWKMJWMEsP8c0vUd4xp/RM
 nRaVFIAVN5T1R7ZX0889H3ArewCkluBM1BkK+Wa0y7Wz09GXDQp9Lo0O9DlrdJaEVzL5
 NKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DMsu+pzAlqXLFqCFHczAJnKB7kERRvXtZgg7glElDEE=;
 b=irEAqkt2pidGzqn7YDA6FzlSBGZ3wB7AjycFjD1mpCBAwg6g/NJJSPDPtPuvjkD3ax
 458M8tOvJcixCllXNo5cXt23aYMJeqEkUxR1Cye/he+hSZlrxZzzrYU9p+4e+CDpqVJt
 nZHqylh8xvBvK0PlrJUe9A+XJs0PIel3XlV3N2VX4gFTaW0leuQv32UcPqkjxvtVqbEO
 5Si7ljwUTC2SZ54m6Bpi28u/WbVg2TGqLCWppjWq475m3BFHZUfe10eM1jWR3QIvoEzO
 LgiPUgGFjZoCexeErmi5ldq9DV9X6pjfvFWnF5dW3K9l+kKlWU+w7VQxdzc81urRCQV3
 UleA==
X-Gm-Message-State: APjAAAW3ccOC3PlE7NRryEM7+6MyLQE/UvZxC7CWLQO8JBgJldJm05cB
 sOH2Yd7dth+XufXiuDcg6DGPXck12XS2lLfVHw==
X-Google-Smtp-Source: APXvYqzKd9r93QAg17E/2JmGkVuAU91vw06mrBRJQpRUyQNpII1YFdInRFvW6WXcUMJ9fmuyojM+54xE988qdA6WcEs=
X-Received: by 2002:ac2:5bc2:: with SMTP id u2mr5097690lfn.173.1572561536258; 
 Thu, 31 Oct 2019 15:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muCW3ow-9UkdtBK9sxRrgK92MjVQZfe6W+DS0XKYVRF9Q@mail.gmail.com>
In-Reply-To: <CAH2r5muCW3ow-9UkdtBK9sxRrgK92MjVQZfe6W+DS0XKYVRF9Q@mail.gmail.com>
Date: Thu, 31 Oct 2019 15:38:45 -0700
Message-ID: <CAKywueRROHSqc+tiggojNabwqOtfcvvTfMPbT6bmS4r9WDEZXw@mail.gmail.com>
Subject: Re: SMB3 Buildbot regression tests added
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

cifs-testing group has 109 but not 091. Let's try to keep  the Azure
bucket as a quick subset of tests that we have in cifs-testing one.

Best regards,
Pavel Shilovskiy

=D1=87=D1=82, 31 =D0=BE=D0=BA=D1=82. 2019 =D0=B3. =D0=B2 13:19, Steve Frenc=
h via samba-technical
<samba-technical@lists.samba.org>:
>
> Added xfstests 091 and 109 to the (SMB3 Linux kernel client) Azure target=
 bucket
>
> --
> Thanks,
>
> Steve
>

