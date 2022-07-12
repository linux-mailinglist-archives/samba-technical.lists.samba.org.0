Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED4B5712C8
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jul 2022 09:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0SR11JOlqS86kYB77tLwSQhTs+CSI9KEYKU5NjcFe5k=; b=wDN3TSw+eVxzTDcF/PQCrLzQyT
	HGICpnFwRlsFdu7ZOUtpRRaS+fXMfM34mfl5hJL/BjNOVdc13hblaoSqlmqnbblCxhaNFtgFgp4ph
	Xw4c31vMqa9pA0Vd9qjS0DnX2MdOsHUObBKW6lkmQ2++dbJdssRgE76GgDMULjZrALd3pffkjLhEq
	D8zx3+PUI9FsQfeHbynAOZrwlZEMwDuJmbNiJvp7Lg/8q8v6pNvDiAWuvRwf4NaOEUr7rKO9ArdFh
	ZCn/h2mvIHqaZ8/9BVybaAcaeSyF+33Z0EOd3DprpIUC5aytlBeHq3/aiSbSlBon2xVZnmeROrwc6
	RFDUpdGw==;
Received: from ip6-localhost ([::1]:31942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oB9x9-00H7Pq-9D; Tue, 12 Jul 2022 07:05:03 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:33421) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oB9wp-00H7Ph-E2
 for samba-technical@lists.samba.org; Tue, 12 Jul 2022 07:04:46 +0000
Received: by mail-qk1-x72b.google.com with SMTP id f14so5640043qkm.0
 for <samba-technical@lists.samba.org>; Tue, 12 Jul 2022 00:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0SR11JOlqS86kYB77tLwSQhTs+CSI9KEYKU5NjcFe5k=;
 b=TOWZ+dbZrdVAcKgbyHn+DOS5qzJPrQvvQaB6622RvJO+urOcAS6Y7AnMOElWOP+TED
 aj2m58Os8og+ZBQy9G1o6nQdmea9sxJOm6GOHsVABGPawRr+ufUZNXstYCIgc54C2kj5
 NQ8feYlzBnLK8JVhgLbtDOP8lgwpYtuk5SFYZ5LHGpPt3/fv/J2xI/K1ngiNiDJVJmGr
 pnGBRfA8+zIr5H3g92bthjrNeIgZOTgMT+s/PRMTJOH1jrq7fOb0MLcd2wFEazrC9a9B
 yVEgXTdWm2Nxn6stGJ++P1+5uDvGKSrYt0SnuMMynOt3QBIoKDJbI+HLNH3E7EudCJze
 AAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0SR11JOlqS86kYB77tLwSQhTs+CSI9KEYKU5NjcFe5k=;
 b=CeT+QHF8eGFe1C+3pL+coszyNSS6uK8Gd5LgI46eJb5GNb7IK3RIg7oOKu4LNGEt8L
 VtdEYHW/sR3VzJUmcuoSdGpDd5sKNxAqTLPOkEzlih9pyqQiskH+9OCooKfvXg1YppO5
 2FLtk5SAuo6TOptSQOD2FMh//eXDDNnOqp8xUzX0bp0rg5Rb4mfDqpROhxXtbaZPtbfT
 feIvpynecBu/umCOL53Iy0wNvZAnxcqWL6xv3geGmC7zK/vXjzaEEvlj+pDb7erIC/pe
 6AHHeo3VBbtQDDqZwMOEYL3Y7bVvxlqeHgDHSzWHZjdZn5ixvIQRLxDYtOZAt5kGkcBr
 4WpQ==
X-Gm-Message-State: AJIora9N3PvavI5Uj5KZvQVuHkTUtRbURhFUSuXlvW9Bs3jdLPYsd4NQ
 teJyDdaLcgNaAbuSecQYo9axeUNUVvfmK+Jp5Yk=
X-Google-Smtp-Source: AGRyM1t42UeQuuXca2u1hT62pefv/Zz8qnm+InhzVAcdPcHBASnoVTryiA53z10tikXE/RMTK1DKrkce6y8Oaf6+n1Y=
X-Received: by 2002:a05:620a:46a2:b0:6b5:5998:17a1 with SMTP id
 bq34-20020a05620a46a200b006b5599817a1mr13455387qkb.208.1657609481439; Tue, 12
 Jul 2022 00:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtuN-yswT5VTbNPzj02fwiHYOCe2eR8mcgRgRE8Qpkjgw@mail.gmail.com>
In-Reply-To: <CAH2r5mtuN-yswT5VTbNPzj02fwiHYOCe2eR8mcgRgRE8Qpkjgw@mail.gmail.com>
Date: Tue, 12 Jul 2022 12:34:30 +0530
Message-ID: <CANT5p=p-hCPd-faCs=MsBaVAkS07AFexeUjujysZ=ukQSAnMxg@mail.gmail.com>
Subject: Re: [PATCH][SMB3] workaround negprot bug in some Samba servers by
 changing order of negcontexts sent by Linux kernel client
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Julian Sikorski <belegdol@gmail.com>,
 Paulo Alcantara <pc@cjr.nz>, samba-technical <samba-technical@lists.samba.org>,
 "Stefan \(metze\) Metzmacher" <metze@samba.org>,
 Brian Caine <brian.d.caine@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 12, 2022 at 11:04 AM Steve French <smfrench@gmail.com> wrote:
>
> Starting with 5.18.8 (and 5.19-rc4) mount can now fail to older Samba
> servers due to a server bug handling padding at the end of the last
> negotiate context (negotiate contexts typically round up to 8 byte
> lengths by adding padding if needed). This server bug can be avoided
> by switching the order of negotiate contexts, placing a negotiate
> context at the end that does not require padding (prior to the recent
> netname context fix this was the case on the client).
>
> Fixes: 73130a7b1ac9 ("smb3: fix empty netname context on secondary channels")
>
> See attached fix to cifs.ko
> --
> Thanks,
>
> Steve

Looks good to me.

-- 
Regards,
Shyam

