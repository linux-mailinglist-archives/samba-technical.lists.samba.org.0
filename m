Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C936FB64
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 15:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6CJOfcNctzjuJ1S4q10/ikX/ccg6HTsRxbmY/IKFOSs=; b=Cp+ocBlh5U9R9XLgl4mC/bYaKn
	uhWgACjQV9jQSo7iJ2pQBpmqjprgWk8x7xFu4eShW4ttaYr/bwIEJmESDGLNYuxBR5tS3M8AsJi1d
	Bw7b/tSbwphNdKFcy691o3594kURvcjvp5cwPrlQNCChyxuemvzUG0k5lg+OLNbYzrBth+Qih06Eg
	THMgyB8UzKQnMD6IUr99IMTt0rZ3+XMkKngUz23yAksZ4fUzOHtnEBc+j8WUNF6ZYt/tDlKhQYQHa
	x2K18tktxxjYAhIcPFZ9QkYXvUdgoP1HIqdhNt2xgh6MVGsXGTgCAfhb/woSSpFDTxl0a2aaEoyri
	EW9jZcqg==;
Received: from ip6-localhost ([::1]:44580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcT6c-00DJ8b-Fv; Fri, 30 Apr 2021 13:22:54 +0000
Received: from [195.221.236.186] (port=47774 helo=smtp-out2.ac-dijon.fr) 
 by hr1.samba.org with esmtp (Exim) id 1lcT6W-00DJ8U-6t
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 13:22:50 +0000
Received: from hermes.ac-dijon.fr (localhost [127.0.0.1])
 by smtp-out2.ac-dijon.fr (Postfix) with ESMTP id 427D9B8E
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 15:03:16 +0200 (CEST)
Received: from [10.0.0.154] (85-170-166-112.rev.numericable.fr
 [85.170.166.112])
 by hermes.ac-dijon.fr (Postfix) with ESMTPSA id 7AA93FE4
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 15:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ac-dijon.fr; s=smtp;
 t=1619787794; h=mime-version:from:date:message-id:subject:to;
 bh=6CJOfcNctzjuJ1S4q10/ikX/ccg6HTsRxbmY/IKFOSs=;
 b=BMQ0v2VHs3bW7JGEkNkeh1Pe+igCrGDfVkzACYQXLK1bWxR69sqsxalQ7nmLwh2ZDvzpq1
 V15jmj1Nv2nOBBdz6/W0wYTPUx4tILBgN56G8wYvbft3rzJ3q578RouifitvJoV4lDiJAS
 BO85lU+aRHdKsgXvBSTQZp0XTq0/UIF1HNxP0Of9HJPBRME5c45o2P0eY2N/MM91wxR9de
 /q4ietxMpXazOReBn3jd9Q/HKXu1mLWUdCKldgisuA86NRoVPnnba0NSf4nSAGzetTCLhU
 mOrzk0i02KrOg75O+WE54fDYC5UEBnoElzeIP3dYQP8S9fPd9upwT/dK6sfeTQ==
To: samba-technical@lists.samba.org
Subject: GPO created via samba-tool don't Copy or Backup
Message-ID: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
Date: Fri, 30 Apr 2021 15:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Klaas TJEBBES via samba-technical <samba-technical@lists.samba.org>
Reply-To: Klaas TJEBBES <klaas.tjebbes@ac-dijon.fr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello.

I am facing a problem with GPO managing on the Samba side.

When I create a GPO named "test" using the RSAT on Windows, I can then 
Copy and Backup this GPO.

On the samba server, using "samba-tool gpo backup/restore", I backup and 
restore this "test" GPO under another name, "blabla" for example.

Back in the RSAT on Windows, this new "blabla" GPO can NOT be Copied or 
Backuped. The error is "invalid directory".

I CLOSE THE RSAT.

On the samba server, I go in the "test" GPO directory (in 
"/home/sysvol/domseth.ac-test.fr/Policies/{ID_TEST_GPO}") and do :
  getfattr -d -n user.DOSATTRIB -R . > ../test.attrs

Then I go in the directory of the "blabla" GPO and do :
   setfattr --restore=../test.attrs

Then I return on the RSAT and now I can successful Copy and Backup 
"blabla" GPO.

Why this problem ? Am I doing something wrong ?


Thank you, regards,
  Klaas

