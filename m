Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657C2D2184
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 04:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NYgsmDl9Q72JcbWBndYqFmNBcQEpaApqyOzzwDnVK3c=; b=LD3ToXELuqwvK6Lxlvh7DDjSwM
	DIItZPr39A5RPnpLMg/LBCm/K7yIuZ/IvGltlICmD5y4J5absswFeEMyyASetkHXdNQF6zmSZsh8c
	kcbp6bjucWNm5o3rA9JtL14HkHyq5CS7y3VVy1K8csupwUpI4ffeKCNC41s2USNHmDGtiYIZ8wiDB
	rAXCl4e5cZPnDc6AUFQUDAYH0k7sUYKc8PaGg+6xsIcwHb8gxMpTy7pruIqBsZQcVcdo9iLWbEsTw
	GA8fi0dUfCzoJuaja013G5zSc9JvLDuEcLmKAxLzmRNKjR1W5DCzRxd3KVEXNjY6+HcnZlvaszBgB
	Im++AqLg==;
Received: from ip6-localhost ([::1]:19660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmTrb-0009bO-1W; Tue, 08 Dec 2020 03:40:31 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:35950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmTrV-0009bH-N1
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 03:40:28 +0000
Received: by mail-io1-xd34.google.com with SMTP id z136so15604373iof.3
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 19:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYgsmDl9Q72JcbWBndYqFmNBcQEpaApqyOzzwDnVK3c=;
 b=o/q3tj5GGvaWG2+Jok1tbhdDW0t15SqYlKBVSpF46835259EhwtrytSu5gk/ZetFmx
 b9fAbVH/pHfoquBbm6YNkTBvomdMu47dC70/6jTUbTBw+JoYcVyRk65+IVjErP8yvYCk
 JITng4EWYRNjEGzLPTWcQ8G1IdPkQLDWrW5exc9sQ+h1yVrnYtc5cVo8INmYLoPUl6Nr
 /1eoLmu0VTCX+JoRAq1+0dumNvoKv+Q3qJ7RTmFZRTdi6pHfH3hx92ZpzsfQDytP3/Sp
 SOnH0gq9/bOhCkxzT/ipXdO8ocxIv5R4rGmzzwmQnUb/ewhduSM9g3z19rTFXnF7CgZe
 U6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYgsmDl9Q72JcbWBndYqFmNBcQEpaApqyOzzwDnVK3c=;
 b=KuBBbU6+hfCESPHEojPvTOqdc7TCjZm+Zsmw2ABX2732MyRonCmDU9fi0i1sbuk6q/
 0SWXFvtn4MIKlE5XwjzhDKbl/HvhRboVAmq9kbSaMAvawkVFZmR8+0QEy20xwevNwhGZ
 kDn8Ae4NxGjbuyvMAK9hOp8ExupISQhHIokUlSt3wRktwk9n4J03g2skMpkGx1Ja60S1
 8Gv4FlVYn8Q3FhW6wj358kLfJILqQnS+6jIQmh4gh/nbmWkDrdWHm0YvhQH+C4kOa/Hd
 ueDxWWtfZMlCgjAUtYmcHLFa1yVSRtHMTfaX4B5518luljmKcPmIBmFT34NMM28i6jz5
 68pw==
X-Gm-Message-State: AOAM530A4+u+NWcgtbGN85MqQwCSK5f5L9STRBZDgzWui4eGo9rOn+CY
 +1cX65mdLgrLLDAswvagUcOJOKIVgPPm5qimMVQ=
X-Google-Smtp-Source: ABdhPJwcD9XE6N9Unut9mDdnM3ExGo2CYjx/CiFinIG55oSxUa2AdQKcqVt0+Qf3ncEF6HqV2cse4ca6kpN/bk35XuM=
X-Received: by 2002:a02:c90f:: with SMTP id t15mr24940004jao.20.1607398822403; 
 Mon, 07 Dec 2020 19:40:22 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
 <008101d6cd05$0faa5500$2efeff00$@samsung.com>
 <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
 <008201d6cd10$d5187910$7f496b30$@samsung.com>
In-Reply-To: <008201d6cd10$d5187910$7f496b30$@samsung.com>
Date: Tue, 8 Dec 2020 13:40:11 +1000
Message-ID: <CAN05THQ+wymmyA3sxkZC8ugdD52FvjJ53u2+8c0Mq5YdW1ankg@mail.gmail.com>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
To: Namjae Jeon <namjae.jeon@samsung.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Joseph <j@gget.it>, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 8, 2020 at 1:20 PM Namjae Jeon via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
>
> > -----Original Message-----
> > From: Richard Sharpe <realrichardsharpe@gmail.com>
> > Sent: Tuesday, December 8, 2020 11:21 AM
> > To: Namjae Jeon <namjae.jeon@samsung.com>
> > Cc: Joseph <j@gget.it>; samba-technical <samba-technical@lists.samba.or=
g>
> > Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying b=
ig files?
> >
> > On Mon, Dec 7, 2020 at 6:12 PM Namjae Jeon via samba-technical <samba-t=
echnical@lists.samba.org> wrote:
> > >
> > > > Hello,
> > > > When sending a big file (for example 2 GB) from a Windows computer
> > > > to a Linux computer (with Samba server), then:
> > > > * if the destination FS is ext4, NTFS, no problem
> > > > * if the destination FS is exfat, then there is a strange delay (~3=
0
> > > > seconds) during which the Windows Explorer waits, before actually
> > > > copying the file It seems that the Samba server first "preallocates=
" the 2GB, before accepting to
> > start the copy from Samba client.
> > > > Thus, 2GB (of probably null bytes?) are first written, and then, th=
e actual file is written.
> > > > How to avoid this effect that doubles the number of gigabytes writt=
en and doubles the transfer
> > time?
> > > >
> > > > I have already tried:
> > > >
> > > >     strict allocate =3D no
> > > >
> > > > without any success in the exfat case.
> > > >
> > > > Any idea?
> > > Windows seems to send SMB_FILE_END_OF_FILE_INFORMATION smb2 setinfo
> > > request to pre-allocate space as much as the file size before writing=
 the file.
> >
> > I believe that Windows does this because applications are actually writ=
ing into the Windows equivalent
> > of the page cache.
> >
> > To avoid problems where the server runs out of space when the cache flu=
shes, they send a request to
> > extend the file to the new EOF when a write to a larger offset occurs. =
That way, the ENOSPC error can
> > be returned on the WRITE rather than on the CLOSE because no one checks=
 the error return from a close
> > and anyway, how can you tell which write failed when you get an error o=
n close?
> I didn't want to remove ftruncate before writing in samba. I mean that th=
ere is
> an improvement if exfat fallocate is implemented. One misunderstanding is=
 that
> the FileEndOfFileInformation request must change the size of the file.
> Because of that, We may not use keep size flags of fallocate(). BTW, Why =
do
> windows call FileEndOfFileInformation instead of FileAllocationInformatio=
n
> of smb2 setinfo before writing?

They have slightly different semantics. FileEndOfFile both sets end of
file and also allocates all the blocks
(for the 99% of cases where the files are non-sparse) while
FileAllocationInformation only allocates the blocks
but does not set the end-of-file, and also once the file is closed,
any blocks past end-of-file allocated with FileAllocationInformation
would be deallocated and returned.

They have always used FileEndOfFile, maybe they are just afraid of
changing the semantics and that this might "surprise"
applications.


>
> Thanks!
> >
> > > samba fallback to call ftruncate if fallocate is not support in local=
 filesystem.
> > > I personally think that it is possible to improve the problem if exFA=
T
> > > support keep size flags of fallocate(). It doesn't support yet in
> > > linux kernel exFAT, but I have a plan. exFAT can store the number of
> > > allocated cluster size and the current file size in metadata of file.
> > > Unlike FAT. so it seems that the fallocate can be implemented properl=
y in exFAT.
> > > >
> > > > PS:
> > > > * I've already tried exfat-fuse, but also exfat-nofuse, and also
> > > > exfat (non
> > > > fuse) included in Kernel 5.7, and it's the same.
> > > > * There are many forums posts with the same problem, e.g.
> > > > https://www.raspberrypi.org/forums/viewtopic.php?t=3D206866
> >
> > --
> > Regards,
> > Richard Sharpe
> > (=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=
=9C=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=
=BA=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
>
>
>

