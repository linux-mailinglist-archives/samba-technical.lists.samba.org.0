Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BA3C0A8
	for <lists+samba-technical@lfdr.de>; Tue, 11 Jun 2019 02:42:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LTh7h4fwgu/IdLNqhRirFuzkrJkPBdU70QJ+oK60Rks=; b=F2e7vn8/eY/UPWnqcG6UydDDLj
	0KCu8g7CkgXHJblocQJ1XhTjuo66BU9Iq7HJEK1WcVdBavPkvUl6AVD4BUBGMpOrKl/W/9N66B1JE
	TjupNVejS2wV1HlwsGybBFAjNPKr7UtBzVVNGxNNED/73c0jlYx2aM+7FUK7VryfGPVgrl138/P8R
	5Zml6RX69v+9oBeRpIAvNpVl0d5e9Xisxku4FUvqylQg8hXFjnfAdzDRFQ+z5tF164fLMxqF4VDMt
	DZpxXhYlr5Jksyg4n/tKO1rAAxC1wJIBUTjb11eQ5CXBJsExw4B+HhPOsI9cIpc6r1v7AEsR+LX+l
	Y6624uXg==;
Received: from localhost ([::1]:36558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1haUqo-000qgP-RZ; Tue, 11 Jun 2019 00:41:22 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43672) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haUql-000qgI-0m
 for samba-technical@lists.samba.org; Tue, 11 Jun 2019 00:41:21 +0000
Received: by mail-lf1-x129.google.com with SMTP id j29so7930184lfk.10
 for <samba-technical@lists.samba.org>; Mon, 10 Jun 2019 17:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LTh7h4fwgu/IdLNqhRirFuzkrJkPBdU70QJ+oK60Rks=;
 b=dqql54mLFx32R5XqDQvMgr1zgOL1adNKtsldm+Xn8K8GouJsDRX4S73PXI/+STxyDX
 hBgjfzpoxjwIMcXlOo9cBhUm8jKkW9C9F9sQFHmQsZHiH+PQXtT0g0u5qFGBy9O3BS90
 3YxLTQSULLMQW8dOFzd6eyIDOsD8Uv/cCX9qGjPPticpg0FIvqxINFV5aOdrKezs/Y27
 Jp/BqevykAP6yt9BGqJh2WCk3H8JN42JiykLvykGnumfQAw9a83o+rg6h6H318pde0kp
 5llUGdc3eU6inqwuXrk6OoMNWHcBqbvCWKW+J7xxcHijORey5RxFFB1HP+TUccIFlPcV
 yHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LTh7h4fwgu/IdLNqhRirFuzkrJkPBdU70QJ+oK60Rks=;
 b=jjRTis3+pJo35fikU+zJNB9y3nD5Yxv1a0IusDxdWkza5YGsxUi1SibLjQjQekV21a
 lszdOye2wB+o3Kyzd00ExKUnUkZNn/+Xoyk6AdU6yhP7/UxozfCShxAfM0l1Y128pW2+
 kPpryOM5wopmpe2i2lQO8/AQDRqr5quGXSqmVEfZdts22lb5tbEQXdlZtwO3SMMg/liR
 PbBWaEwkqjQJbzcTKaPxkCGSr8cH1ndJZecXav3xW8g2MJI0ZQ+1jLjaktZsnBfkIem0
 EfuNVQuIP2vJ1pz1aBGpGi/NR2vlNTE482i6D73R5y2E8ptypmeiKTTDgO5JVnIj7BFA
 SpVQ==
X-Gm-Message-State: APjAAAWvbw/pV4V1AeEaT22BQcdNmAzdQ62eIK9A+4uf3lTQpic9g3Xi
 6ILiD3VnWvySo8ghzZtfHWoYBYqfZOW+bniucU6swyM=
X-Google-Smtp-Source: APXvYqx4Wsa/kcO/OivCXZfzgGN/lguwrntS2svHyv0Cu7GknbQV9ZTBr2qZpd2QQAlDN4YqQ8WhLgeFFtvar2lueHQ=
X-Received: by 2002:a19:700b:: with SMTP id h11mr35137919lfc.25.1560213678086; 
 Mon, 10 Jun 2019 17:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
 <CAKywueTTp_jQqhND0gpLhffNeXudPUjkWHGEze33+=6oVWhLpw@mail.gmail.com>
 <CAH2r5mvo5YbDd5Pqu6XcMBAW+4rPX0ZZU9RBj=NWLEFTp4L+-w@mail.gmail.com>
In-Reply-To: <CAH2r5mvo5YbDd5Pqu6XcMBAW+4rPX0ZZU9RBj=NWLEFTp4L+-w@mail.gmail.com>
Date: Mon, 10 Jun 2019 17:41:06 -0700
Message-ID: <CAKywueRauK_Lf_NMKJgKr46tLMOgJyk6iWcsMuPx74EJ3cGz=g@mail.gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
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
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D0=BD, 10 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 15:34, Steve Frenc=
h <smfrench@gmail.com>:
>
> Updated the patch with Pavel's suggestion and added reviewed by and
> repushed to cifs-2.6.git for-next.
>

Looks good. Thanks!

Best regards,
Pavel Shilovskiy

