Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5C3FCFD8
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 01:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rK0lhNpSkfQUYRREIH98tkAX6QD0CrdFI+TVJ5vqku4=; b=jXoYnHpDqnaCCd4dEgiBbfu1+n
	UD7Za9mr1XirzMkCfAyZuOAGhG18GI1fX2RmM/OGVnc/PDrRIy5lX8FMTtYrTpinyNNjTnfSE5u2o
	oO8n0muTJJbiQVt+c/QBoYmgCNI9EKJhi0Bequnny9qI0QCdrJMFDvwRlfPk03fPUZU65ngDf7wp2
	yUkVZ87RE11ja8KvKtIwyv/6Oiwk14ZmyB9c2t1wPs9Ok5Bxe4an1tzaMsuZQG51umW0/o8gP9RVK
	TUCPMNuo7UrH94zekFNhIEqhe/5IeMHCnKF5/p5XwqCgFba/Oz727tHCwA1eOc/PxZoGFZ0+reUF3
	ZJE8KHcw==;
Received: from ip6-localhost ([::1]:64746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLCzB-00APG4-Rr; Tue, 31 Aug 2021 23:16:09 +0000
Received: from mail.kernel.org ([198.145.29.99]:54544) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mLCz3-00APFv-VQ
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 23:16:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1815B61026
 for <samba-technical@lists.samba.org>; Tue, 31 Aug 2021 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630450711;
 bh=rK0lhNpSkfQUYRREIH98tkAX6QD0CrdFI+TVJ5vqku4=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=AuuXVFq5g1LNTffFQLxP4vJPrn+g9nMJXIi7/lCG9iP4slWzPD1fY2wFF6LvCj6gJ
 nt5pawNzdt0Y3bSQsFs9NjF3pRcVEpBdLEwWDNH/f3ktqqsDtOHUkWOpGHR91RGvvY
 ElfTlMxsUNMFFLnfXdZyVbkw9R4GdYArFTKaVgDXiiJbb+3NvvyK9agWwGSMnlnkFq
 zMlas7CzpAm/pr2qmi5m2eGkzQ2tnbvMq/ayPVzEtBzVbUM6rij9bPI0R2zU3uVaYa
 SspoaDKNVlkpvuQxdBXPE3I93WLNiCLi8In5A+En+TyAdaMT5CiZOZQrxq9Ekdmbpz
 YRiMYOqUfkjCA==
Received: by mail-vs1-f54.google.com with SMTP id q29so891321vsj.13
 for <samba-technical@lists.samba.org>; Tue, 31 Aug 2021 15:58:31 -0700 (PDT)
X-Gm-Message-State: AOAM532grUN+1HQFWha2fkbOrHoBA+T3HnsgHW7xDjVX2bZlvkxhpVHU
 qeT7UK+Gi+kUAaVlTAMqnkanFOybVnhqG8Tq7ig=
X-Google-Smtp-Source: ABdhPJwFFIgi0Of/u9RcbfXaoQtP4BCznXcNHf7Td6R4xjNNGNGQTUyWvEPXt8i5GNVYk2zehE8H9CVDHPa+PpxO/Lw=
X-Received: by 2002:a67:d095:: with SMTP id s21mr21535741vsi.37.1630450710253; 
 Tue, 31 Aug 2021 15:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6102:c47:0:0:0:0 with HTTP; Tue, 31 Aug 2021 15:58:29
 -0700 (PDT)
In-Reply-To: <20210831234757.7467527b@samba.org>
References: <CAH2r5msoKV7qAgoKipa+QNDJ+xR83YGuz+he+GH9sPTSzBMLHA@mail.gmail.com>
 <163042809342.7406.683232852261811056.pr-tracker-bot@kernel.org>
 <20210831234757.7467527b@samba.org>
Date: Wed, 1 Sep 2021 07:58:29 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-N2BQE1JQ_UgLc=ss8cuvaE0GMKQDrEhMTOMPLeG5-Jg@mail.gmail.com>
Message-ID: <CAKYAXd-N2BQE1JQ_UgLc=ss8cuvaE0GMKQDrEhMTOMPLeG5-Jg@mail.gmail.com>
Subject: Re: [GIT PULL] new smb3 kernel server (ksmbd)
To: Samba Technical <samba-technical@lists.samba.org>
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
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Special thanks to Steve and Ronnie.

As soon as I woke up I just noticed that ksmbd was merged into mainline. hurray!

The dream has finally come true since sharing the prototype version
with Steve in 2015. First, Thanks Steve, I think that your advice on
the redesign of ksmbd and what we need for the smb server make current
shape of ksmbd today. Also, I am very grateful to
Ronnie's e-mail telling me not to give up and continue the this
project and lots of technical advice as well!

Really thank you so much for supporting ksmbd upstream again.

2021-09-01 6:50 GMT+09:00, David Disseldorp via samba-technical
<samba-technical@lists.samba.org>:
> On Tue, 31 Aug 2021 16:41:33 +0000, pr-tracker-bot@kernel.org wrote:
>
>> The pull request you sent on Sun, 29 Aug 2021 19:32:41 -0500:
>>
>> > git://git.samba.org/ksmbd.git tags/5.15-rc-first-ksmbd-merge
>>
>> has been merged into torvalds/linux.git:
>> https://git.kernel.org/torvalds/c/e24c567b7ecff1c8b6023a10d7f78256cef742c4
>
> In case any one missed it, ksmbd is now queued in Linus' tree for 5.15.
> Congratulations to everyone involved in this fantastic effort!
Thanks for your mail!
>
> Cheers, David
>
>

