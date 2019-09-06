Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4FAC2C3
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 00:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ollU1zyU3K+04nLtVkrxW8XcA/8tUXtuP5hB5eMqNuU=; b=i4/DxlGy3Eb/jI3VkxbP2sjnTA
	j2bwpBbEK1A2zJZN1ox3n44VJqvmL1H2lWS+CO6HYSvju9DzxtkvRgUBdQSRWwjvlQ4f6ZaN7eg2v
	6xuedEt8Ue5Tva0g3eFPO+tXiqT9/ifce1mh+jL5myMee9knDPKw+XdxZ6fFGYq7OdZhTttzaf1cz
	wTz2JOb1PFgSvCwkRRIOkmoD0yx4lgLjM+ak8ywNpxgxXlmlO4m2NEb/GyOllH4tDsSAfG7L3dKU0
	CdVRtRo4UTyrkN2IzHYl3etfMrybxEfECtBJn2XpDubEZSErUTLTX7TWgc0dMddje5pcxarsoJcit
	UUL6epcw==;
Received: from localhost ([::1]:38558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6NAb-0047Vw-Me; Fri, 06 Sep 2019 22:57:33 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37289) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6NAW-0047Vp-IQ
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 22:57:30 +0000
Received: by mail-ot1-x335.google.com with SMTP id s28so7281321otd.4
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ollU1zyU3K+04nLtVkrxW8XcA/8tUXtuP5hB5eMqNuU=;
 b=EIdqkRqWcglB9wMSizj7kDNZScFoY7Z8+ssalEkQ2a4LukzTMnmPXHlI1wT3CUYv4y
 d95QNV+jxO22esItgMShMsHX0e/pCpwvZdFUiwcwYcifjy3e0uIhr9m9+NCQgRmMSHXb
 v5Lj64G7XcahLilJKVpyFAeDQDJtjwdoE7W4Z26B43MErH/KtwG38fcTlQnSh7bd53sQ
 6GYwGiC36UkLHkitew9jcGBPrxqmBtj7WOVSwpjmbDlQCKxxWqjOxdY5KMmF0A+zQ79l
 X6N5VwFjB/YQC+Z3BY08XMslGoftrI1MUFFP5RWFf0sT61HcHHGJ9eX82hycmSpMlUzb
 wZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ollU1zyU3K+04nLtVkrxW8XcA/8tUXtuP5hB5eMqNuU=;
 b=CZ9+oZwaDpQSxQoNdM7ijTPK8x/5g9STY9fYZ0HP11ipN2n8iZQINUBPB0aLREg+eW
 Pmxu7dP0vI5Pz4xYJ2NA8Nwp0cf+X/JmtRdtBceQUqDKekGCCqON6G06r88kz3S5DBNQ
 MCJK+rYtbM8RhmG3tsnpzJ7wWJpwC0s2jEFP1eNlqSMU1YVtWVt+TcGg0trWkUEyYKoc
 kG4mUfLMaQJVP57f4TT1n5oCjg8538yPMO6Lpwok40hHio6ptdh/3Kvayu5JHhxH51Kz
 BW2Ki9uV121MX01xbUxIae6WcSB6JwyPRgFSRu3M+hOy+efr7uvuP5/yMnjsdejFVJ6e
 KSvg==
X-Gm-Message-State: APjAAAVhZ2wIgz+NIbuqm+urZpHP8QzOb8uIf0+C9whcxjN/7tUq9Ecx
 TWXkcO9Rg4tdwMx2efl3/1bgWEPNtYbO87CkyeU=
X-Google-Smtp-Source: APXvYqw3tE/hS3V6CSW0lRJ2lLgsBeYPC3pxO3Ic3kuEp7/gcbt9UMKfsJ8G6SvrNFJnDCjvLxxdPY4LqyotgfOEY6Y=
X-Received: by 2002:a9d:3288:: with SMTP id u8mr2732754otb.120.1567810644941; 
 Fri, 06 Sep 2019 15:57:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:1d4b:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 15:57:24 -0700 (PDT)
In-Reply-To: <20190906161845.GA192819@jra4>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com> <20190906161845.GA192819@jra4>
Date: Sat, 7 Sep 2019 07:57:24 +0900
Message-ID: <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
Subject: Re: samba performance difference between old and the latest ?
To: Jeremy Allison <jra@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@gmail.com>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, sergey.senozhatsky@gmail.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2019-09-07 1:18 GMT+09:00, Jeremy Allison via samba-technical
<samba-technical@lists.samba.org>:
> On Fri, Sep 06, 2019 at 11:01:51AM +0900, Namjae Jeon via samba-technical
> wrote:
>> Hello,
>>
>> I found something strange during measuring performance with samba these
>> days.
>> I checked the performance of samba 4.7.6 and 4.10.6.
>> There seems to be about 20% performance difference between the two
>> versions.
>>
>> Test environment
>>  1. use iozone and dd utils
>>  2. share is tmpfs
>>  3. smb client is kernel cifs client
>>  4. oplock disable, oplock = no
>>  4. command : ./iozone -s1g -r4 -e -i 0 -t 1 -b 24m.xls -+u
>>
>> with samba 4.7.6
>> 	Children see throughput for  1 initial writers 	=   11248.48 kB/sec
>> 	Parent sees throughput for  1 initial writers 	=   11248.28 kB/sec
>> 	Min throughput per process 			=   11248.48 kB/sec
>> 	Max throughput per process 			=   11248.48 kB/sec
>> 	Avg throughput per process 			=   11248.48 kB/sec
>> 	Min xfer 					= 1048576.00 kB
>> 	CPU Utilization: Wall time   93.219    CPU time   29.517    CPU
>> utilization
>>
>> with samba 4.10.6
>> Children see throughput for  1 initial writers 	=    9018.82 kB/sec
>> 	Parent sees throughput for  1 initial writers 	=    9018.70 kB/sec
>> 	Min throughput per process 			=    9018.82 kB/sec
>> 	Max throughput per process 			=    9018.82 kB/sec
>> 	Avg throughput per process 			=    9018.82 kB/sec
>> 	Min xfer 					= 1048576.00 kB
>> 	CPU Utilization: Wall time  116.265    CPU time   33.182    CPU
>> utilization
>>
>>
>> ================================================================================
>> ========
>> dd test result is same with iozone result.
>>
>> samba 4.7.6 : 11.6MB/s
>> samba 4.10.6 : 9.5MB/s
>>
>> with samba 4.7.6 :
>> root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt
>> bs=4096
>> count=1024
>> 1024+0 records in
>> 1024+0 records out
>> 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.360991 s, 11.6 MB/s
>>
>> with samba 4.10.6 :
>> root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt
>> bs=4096
>> count=1024
>> 1024+0 records in
>> 1024+0 records out
>> 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.442567 s, 9.5 MB/s
>>
>> Am I missing something? or real issue ?
>
> Is this on identical kernel versions ?
Yes, I compared two versions in the same test environment.
>
>

