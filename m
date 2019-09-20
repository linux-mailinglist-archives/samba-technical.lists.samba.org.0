Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD19B9666
	for <lists+samba-technical@lfdr.de>; Fri, 20 Sep 2019 19:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ESelHwgO3+2i5rz/QsN8eVcv4qgUjVwoX52Nxx4zS84=; b=XoTJgPjv3JLOJ4wOttWZEo/ezq
	SL+b8JLt7qb8tv9PlfVq2LbjrfTFsyCKgRofO00cn7fWbY3o9yerSoyrGEDp92rkpzBIXktzRW1WE
	Kr8tJonAMB1c40oU4251xLqgj0zgel5Z+Ovzgsc4dgCeZf2Ej7O8tFZG3WKUsx3a+0b00TTGNcGnT
	Ns1qqG1Ms+aiyhsZjSRI8AzMoCodczVpRsuELm3bqYKa0Ynjg04+4W0pmsaMhF4v4SBORQ6Fo957q
	jLxKspaQ95HBhPBpnXeAENQIovfXr6fNiJyuGdekJbYVx2LqHQqmWIJxj+S0bhpYOq7f8/kSzVa6N
	LV3CeP8w==;
Received: from localhost ([::1]:46348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iBMUF-007GiJ-Eb; Fri, 20 Sep 2019 17:14:27 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:40658) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iBMUA-007GiC-GQ
 for samba-technical@lists.samba.org; Fri, 20 Sep 2019 17:14:25 +0000
Received: by mail-lf1-x143.google.com with SMTP id d17so5566806lfa.7
 for <samba-technical@lists.samba.org>; Fri, 20 Sep 2019 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ESelHwgO3+2i5rz/QsN8eVcv4qgUjVwoX52Nxx4zS84=;
 b=hjKqmRJCPl40qD7zxg2LKEsqEBNkD20wHn7YdPpTvX5yP4s5YwEBKSL6akQAEyLQmJ
 KTF5b4K00ibaDFdf+tzJ7KUcgtf/FweY+oNfoIKvoIx3yoF5sQjP4REJIKrFY9AMSO+Y
 tcCDebC04dzdb603NNXd/iPiiVQsHvJdE0+/aG4TCoAQW8aTQSRpRCsbA4YDj2g89a4r
 Ai0AWM4AKK8126fb8H39kf5pelIEvaZipvFqWwTj3CQpvLoRcEitNyQMn0xfsBN+a8gk
 XoABSLooJAqql6eEXuEuVpziMX8KRSWqkIQuYfAjawlubyo+PVhUSUSL5T1+Xn6hvL4d
 i5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ESelHwgO3+2i5rz/QsN8eVcv4qgUjVwoX52Nxx4zS84=;
 b=Jm26UxirSw05bwgwtBfGB0BhoPmV6LxYvkEr001lGGm58dfEAKp+WyBDydxAuH1gpd
 J6vQz0B/oA6GG5W9XLLSipjsr2o6CxYu5+jIiEFe26MEbSGGCSDlHRCBLyqkS5Ups9NU
 arpJNFeORREMS64rfGGHms4KYhZtdRGwEXjKgVLwzAF+hjBwyUqr9Cheg8cG+BmYfNI2
 QwWV3HlyKrf0QjemVbWrEsl6mUPFQZljfQV1n/txsfAQYs0wzpq9e6yHYvuXHdm1lkmX
 iUmRv8KL/ESxpbbny4bw45BCsG/r3hDmXVlmjcXrdX4W62+pFRGZmi29GGbqcCrt6vrY
 nmpA==
X-Gm-Message-State: APjAAAXU5KbBTZCsdcDhEurqNi11bmuYFz6C2wMpf2kShLMS7ccBAgY9
 ejEwJh6LZSP4eDdvZCgzHjruQIzzPhu+27qt2Q==
X-Google-Smtp-Source: APXvYqxSS//pQQ+Tt4bM3mO16/k+oliOsClZKficPGR4VWE8Mb1aaCigHd1+4k9l+jzr2O3qSeQ1gmG1Mr5Pm1qEhYI=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr9201715lfh.25.1568999660621;
 Fri, 20 Sep 2019 10:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvcRuSihH58GgrzXTAHuXnQ9a0N-d8AkLLOigQrqincKg@mail.gmail.com>
 <CAH2r5mvAw3ShBpy39OodU8EgXqR0rFBmAk0TXJbug1N22R8o4w@mail.gmail.com>
In-Reply-To: <CAH2r5mvAw3ShBpy39OodU8EgXqR0rFBmAk0TXJbug1N22R8o4w@mail.gmail.com>
Date: Fri, 20 Sep 2019 10:14:09 -0700
Message-ID: <CAKywueQW84FxiG1QEmWSJdJiUAiVbYr+0hYVPc4ypW8OAtTZYQ@mail.gmail.com>
Subject: Re: [SMB3][PATCH] dump encryption keys to allow wireshark debugging
 of encrypted
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
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks, this is very useful functionality! A couple comments below.

kernel patch:

+ cifs_dbg(VFS, "ioctl dumpkey\n"); /* BB REMOVEME */

please remove this or change to FYI.

user space patch:

+ if (keys_info.cipher_type =3D=3D 1)
+ printf("CCM encryption");
+ else if (keys_info.cipher_type =3D=3D 2)
+ printf("GCM encryption");
+ else if (keys_info.cipher_type =3D=3D 0)
+ printf("SMB3.0 encryption");
^^^
SMB3.0 encryption is CCM, so, let's not confuse users and print "CCM
encryption" for both cipher_type values of 0 and 1.


Best regards,
Pavel Shilovskiy

=D0=BF=D1=82, 20 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 00:20, Steve=
 French via samba-technical
<samba-technical@lists.samba.org>:
>
> And updated patch for cifs-utils ("smbinfo keys <filename>")
>
>
> On Fri, Sep 20, 2019 at 2:07 AM Steve French <smfrench@gmail.com> wrote:
> >
> > kernel patch updated to check if encryption is enabled
> >
> > In order to debug certain problems it is important to be able
> > to decrypt network traces (e.g. wireshark) but to do this we
> > need to be able to dump out the encryption/decryption keys.
> > Dumping them to an ioctl is safer than dumping then to dmesg,
> > (and better than showing all keys in a pseudofile).
> >
> > Restrict this to root (CAP_SYS_ADMIN), and only for a mount
> > that this admin has access to.
> >
> > Sample smbinfo output:
> > SMB3.0 encryption
> > Session Id:   0x82d2ec52
> > Session Key:  a5 6d 81 d0 e c1 ca e1 d8 13 aa 20 e8 f2 cc 71
> > Server Encryption Key:  1a c3 be ba 3d fc dc 3c e bc 93 9e 50 9e 19 c1
> > Server Decryption Key:  e0 d4 d9 43 1b a2 1b e3 d8 76 77 49 56 f7 20 88
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve

