Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BC3FD0A5
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 03:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+yUZj89PLWt6QWgD0KbWnbV/2nzajPUm8cVJMLYczw8=; b=I9/dtptOf7FrgC+XeEb3T06umO
	9D9a4L6pUIxnD+TPwVXT4YgZgw0GKPG/7J60H2oJCKR5NizNhAEI6+B3Sudrsim61zhGx53JsNJwH
	zMUy3k1IV1F1n3Xcw5Mx0P3D0rqVOWf2+b9f5L1PFF0Z8dd6v/fLcL5XaAFKlhfuCjmiZH2TF+eSm
	iJgsa4CwnHpYphL27ZjjxQqBBjZY8+zHin7QSWq0ZXIvRO+I+DP6jsPHtDBPUhzIBzVKhf5N1fTA3
	cxfhnku1bRyMyLyAavZOYcJdbItVubYfaupc3IgCldcPn5dX9UknfxlovTQ5VmMRVbs6ng/Rk09p5
	CqGCPyOw==;
Received: from ip6-localhost ([::1]:19348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLEsD-00CCKc-3M; Wed, 01 Sep 2021 01:17:05 +0000
Received: from mail.kernel.org ([198.145.29.99]:39744) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mLEs8-00CCKM-5v
 for samba-technical@lists.samba.org; Wed, 01 Sep 2021 01:17:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13CAF60295
 for <samba-technical@lists.samba.org>; Wed,  1 Sep 2021 01:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630459015;
 bh=+yUZj89PLWt6QWgD0KbWnbV/2nzajPUm8cVJMLYczw8=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=EHr1x9OyMAZbRkmwWLc8QP7uTAb7Uh3MEbObWDyi4Xn1hUT1jCa6W4xOBRzfWDMu3
 XoPXneX4RSKQZ+qEpqnTMTzhA4wTXaeJw1vvOIHiM7Cpjvo2jnI+16JaHMs8J64y8G
 Rlk2J5QCEQUFWsEyVft6ZTbkq2m5feA8hLHflQZ10DjbJSniE9JLbktxquvnjb+WOm
 p1xhDSZkXvaReuyKjD/9xTxKwjCGCbXIGf1wOfnMxHOfzPQsoV9D1N2SEP9ZJi0Csb
 D/MBBwn3jytrSAHXFe2gjI0ahdhNFepC21iU6lh4FHuNlDoKmLv/Gr7RT1IjGA32kj
 R7B+P8HBY04vQ==
Received: by mail-oo1-f41.google.com with SMTP id
 g4-20020a4ab044000000b002900bf3b03fso354782oon.1
 for <samba-technical@lists.samba.org>; Tue, 31 Aug 2021 18:16:55 -0700 (PDT)
X-Gm-Message-State: AOAM5313Vvc60TSh2pujQzg9mgaVjGzrxQ9ygqdS4DO3W2P3payIobmL
 GG+viP+WFEFFtobmmQKodvbat0V/ML0K7QFqTH0=
X-Google-Smtp-Source: ABdhPJxaNUtmmN+uKTZ0BkDh29qKbToh2w34oRvXrQYO6hsdoF9azrcQvg5JgoKlAOk7MiyCDuYH79xjWH/365qrJ5Y=
X-Received: by 2002:a4a:ad4f:: with SMTP id s15mr17172631oon.85.1630459014473; 
 Tue, 31 Aug 2021 18:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:1bc6:0:0:0:0:0 with HTTP; Tue, 31 Aug 2021 18:16:53
 -0700 (PDT)
In-Reply-To: <YS7SGLe/56F+DglN@jeremy-acer>
References: <CAH2r5msoKV7qAgoKipa+QNDJ+xR83YGuz+he+GH9sPTSzBMLHA@mail.gmail.com>
 <163042809342.7406.683232852261811056.pr-tracker-bot@kernel.org>
 <20210831234757.7467527b@samba.org>
 <CAKYAXd-N2BQE1JQ_UgLc=ss8cuvaE0GMKQDrEhMTOMPLeG5-Jg@mail.gmail.com>
 <YS7SGLe/56F+DglN@jeremy-acer>
Date: Wed, 1 Sep 2021 10:16:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_EgHEapJdWPwOXiLfhWOD0Ys5wdh4NFQpcmd7Bfi9NxQ@mail.gmail.com>
Message-ID: <CAKYAXd_EgHEapJdWPwOXiLfhWOD0Ys5wdh4NFQpcmd7Bfi9NxQ@mail.gmail.com>
Subject: Re: [GIT PULL] new smb3 kernel server (ksmbd)
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
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2021-09-01 10:06 GMT+09:00, Jeremy Allison <jra@samba.org>:
> On Wed, Sep 01, 2021 at 07:58:29AM +0900, Namjae Jeon via samba-technical
> wrote:
>>Special thanks to Steve and Ronnie.
>>
>>As soon as I woke up I just noticed that ksmbd was merged into mainline.
>> hurray!
>>
>>The dream has finally come true since sharing the prototype version
>>with Steve in 2015. First, Thanks Steve, I think that your advice on
>>the redesign of ksmbd and what we need for the smb server make current
>>shape of ksmbd today. Also, I am very grateful to
>>Ronnie's e-mail telling me not to give up and continue the this
>>project and lots of technical advice as well!
>>
>>Really thank you so much for supporting ksmbd upstream again.
>
Hi Jeremy,
> Congratulations Namjae, this is a great achievement. You must
> be very proud ! Well done.
Thanks for your mail and valuable advice in the meantime!
>

