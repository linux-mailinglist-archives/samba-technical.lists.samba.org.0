Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095823AF93
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 23:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xjLAF5V/dJR/mytGkrlNJYjDYEE6PvttEyK4G1h7QkU=; b=N5/af0y5eQckA2RNVpzd1IVDu0
	XZIQ1QRH9ryquPJZ5yQcgfhdMk7GL8Oa6pORQ5eZ1TyrxEh5+U2a6pYoYRF3tblljRjUFM7+N/9wn
	VXgTDmWQ2zOOlwYErt6qwsn6Yszl2jUEWK0T5AYTlQjWN+A1b6a4m7YV+7MfXYui5lR7U9ao6Zt1U
	i6dNQDGrTPEFPbQPrevglynucVV1eOoUWOHDI+iopfhzP6y70b9f9mNjDxE1Z4HJBCM0KfiT9KiBl
	hGCZrdvwGHFvhrQzOYsECtLmLY+K1TBOxFOrIBQa1OFqkQqQDAXDe3wW65uWXhAX07qRHcWCCU30E
	tS42Fg9g==;
Received: from localhost ([::1]:24600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2hnp-00CNeL-Kk; Mon, 03 Aug 2020 21:15:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37333) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2hng-00CNeE-92
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 21:15:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i26so24952412edv.4
 for <samba-technical@lists.samba.org>; Mon, 03 Aug 2020 14:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3zlXX6dhrNb62xPLX+jR7/DCkckn6MylvjKWl/v3d0=;
 b=i/MCYqGkKq+/0390wZIeOEikE2jqNxaL7lFjRcAXzhMgGyI69JBAZUbFtfdnxAGLfx
 Ngh4qVpgsTuMchnO1hNMHpvTzxBr2HWjjUyoK+HH7Vi5L7SwTlTxpLGX7tYjzUYiey7W
 36Jjs0EnH0RaeUnWbLw3u2EShzm+HyAWweZkavwf0O+ykTv6L9JJGBLG3xMG3vN4HdqU
 NSFv2LW2uEN7xgR9AEAPx2t+R5NbKSgMGNIH0/+tNfDNouvHUk5Ry4VJ/fqz/5ZJWBuW
 H7R0lgGpOrMqLbaPbBbIoHb8ZsjW+05tSIo7yIXy2zZWDAfi3upKHFoE2UCLZXO0sVwN
 MtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3zlXX6dhrNb62xPLX+jR7/DCkckn6MylvjKWl/v3d0=;
 b=Ef/wxPze6lPmdMdKAcrF0NBRFLKrpFBU4UBmIXwyGCFeXOaA9ayCD1WWyNb57IXGqj
 9WxkcdonNCjiZ7NMNNm+skMC8a1YsXOcPE+saxFvguJPTauumiXxGBrVz1S/CsNgYZSD
 td802e1rguuL98Kytj0aD+jybu2hBg6thD4szAsJjw8uKTqJFzYT5w9K6CL+N36v5GY5
 89K8Ui5k2IFjJYT6sHk7/zvd/XbaeGXF7xLcwaO/W470alNB5wQj8lom2VOWS1hjKa7S
 4JYtWgJokQwqIIRE5RD4poO1jBQgK0KtqkO/mj5Ld6U2gkq0UoJraSZit1rs1zr1sl/3
 7UKA==
X-Gm-Message-State: AOAM531p9Bvx4qRcxNcPgwAd4fjrkEzoiJW9HdcszuwANnGNqd9syTpw
 2JRXaYs2ArdYP8eTig5dktEEjx0fftl3sAvEee6qQA==
X-Google-Smtp-Source: ABdhPJy4LdZhqmZ5j49FU+Rf+wlNcUOsBDwPQVlN82a0KRwreXpC4U7DkVKY5WlAltheeDGMF8ZBSu20c/vId8CM5sI=
X-Received: by 2002:a50:ef08:: with SMTP id m8mr10450234eds.339.1596489315629; 
 Mon, 03 Aug 2020 14:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMYxiYw4E5qX7KPMY2gsnd9+y2BkusL1Ef=gZ1i017TWGCmQwQ@mail.gmail.com>
 <CAMYxiYx9QWJKafzy02n34KA2LuGxjKT3i16rR9U1TvyMaA79Aw@mail.gmail.com>
 <9532a8e3-0ed1-3b84-4c89-7a0674e97edb@samba.org>
In-Reply-To: <9532a8e3-0ed1-3b84-4c89-7a0674e97edb@samba.org>
Date: Mon, 3 Aug 2020 14:15:02 -0700
Message-ID: <CAMYxiYxxaf+NRifi54VNRvC6pAQxAc9bdz_+dZLZTnmixNQdXA@mail.gmail.com>
Subject: Re: PANIC internal error: samba 4.12.5 CTDB cluster
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: David Rivera via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Rivera <rivera.david87@gmail.com>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

Unfortunately, I had to get the directory up and running again and
restarted all CTDB instances. Currently, I'm not able to reproduce this on
demand but will keep trying. I'll keep your suggestions in mind and prepare
for the next time I encounter this issue.

Thanks for your help.
David


On Mon, Aug 3, 2020, 12:20 Ralph Boehme <slow@samba.org> wrote:

> Am 8/3/20 um 8:55 PM schrieb David Rivera via samba-technical:
> > Any help to fix this problem would be appreciated.
> if it's reproducible by just accessing a specific directory atm, then just:
>
> * make sure debug symbols are available
>
> * run the smbd servicing the connection with level 10
>
> * start a network trace port 445, raw packets, -s 0
>
> * reproduce problem
>
> Upload the tracedata somewhere where folks with time to help can grab it.
>
> Cheers!
> -slow
>
> --
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
>
>
