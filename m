Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04C1D7DAF
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 18:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yXa57F9esIn6FhSoEG+VxemswPlwXXm1lrb0XQ31EL8=; b=Vqz/lXUvlAKnDwRVS4QwKyVq0I
	RT/uVKQxadt0g95YpYuDNkyNKRlQi8QIkhNW3a4KZTc196nScuLWRPK+TFi6Xr54Oy0/gU/sQ1gGM
	5AVth8eCvEyTIhwYjwCy8vff007sOnDrvdSMt3wQ9pj/WPNVpQ/CXVMuaOYOwE5ozX9rxk5na6fRa
	VMyg7nBqfki/Wts7ISrE4rSbWRXBFjLnG6Gz3kH73girFp4L7603Pvp1B5sD1E+k5IkOIrc+6e+hW
	OxWlpnZz9FU5tIk4s+DYd/Zxq8y9fddT49MC7nQHfBMbwCDoHepm+2zS7qvX6JR0Hdcc0+aePY+Po
	deALjxcg==;
Received: from localhost ([::1]:61184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jaiCX-004wZS-CC; Mon, 18 May 2020 16:01:13 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:41898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaiCS-004wZL-AM
 for samba-technical@lists.samba.org; Mon, 18 May 2020 16:01:10 +0000
Received: by mail-qt1-x834.google.com with SMTP id m44so8477654qtm.8
 for <samba-technical@lists.samba.org>; Mon, 18 May 2020 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xSwm/kiW1Ws1Bl2GbnHZ9cTlC3+GW1DXyQFgP+Bw3yI=;
 b=SGyzabFeQ5gJv08S44vBFWFu6kauafb+GUkG203WkyAPZpB0YoBLbSfS0ttmwhvwvv
 YF1T1pG7AlkiLZpivsKAX54VSTmi9jt3KH1DsPTf0s+QvjbDScdBWMb7sEy7GAnDXec9
 4lBLiq7DL/diZOBgZDymYgLO/dRrlE9i+uFylpFoKnHybXny3RZsuSg8bZ3AwKOthKT6
 1R/MfUB9Jx/Nfs0MSpiSygiyYtm3loEyGjn2GYkWFJHxfmHEDtCunELUqGjgpoGDW8f0
 Q8B7mFjhPr/8IvFDZTmxczbN5nKICoc9F7PoD+2OmSxOZ86/bsdevQIrfQjk9uRXPZra
 GHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xSwm/kiW1Ws1Bl2GbnHZ9cTlC3+GW1DXyQFgP+Bw3yI=;
 b=KQzYrEI61rIGneWuI7z4vFA4tKZrs1np8BMU4/P4IlckzfgF11LXL3ZQs8i7b8FuyX
 YojtzHPeXK2f8YbPtZcn1KS52dg/m5u9GsfWSxShIvnM/wIk8po6QP0HA5JewPdBcQzm
 lPb5QlYgV+3tOhgrYLeT1Ol1yXEzdEv3BDqw/DmpaxU/T2QCrCAYfOOnQcpG02T4LaCw
 yaUNCn95HbVQ4iu7lDSOCboE7CUUKtVxv4hmRB6iRGksLb7LV2RXjzA02S1xsfpGgdnf
 l/g++bp0XwbsaFjolNziY84SM6HoxxgSQKIxJ6dxatvlBe6Islv847FFgLwnyrReewgw
 ik9w==
X-Gm-Message-State: AOAM5303sVXgyxUGt9guKp6p7nnag4xFMkd23etR84x7rQ3qj9pq2Q+8
 FvNbCsPtZn0B5uv/C/Aj/LHqdzrYqSq5K7mvaqk=
X-Google-Smtp-Source: ABdhPJyaY1NkHDh4bUYGQhBlvSt0dn9tk2gQA4z5OYluQ+q0lECO9QDWH8IF21fNjMvw2Z3UT09OICG1CsvFBql0tGw=
X-Received: by 2002:ac8:1a54:: with SMTP id q20mr17410869qtk.274.1589817665929; 
 Mon, 18 May 2020 09:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
 <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
 <d994e36b-614a-06d6-385d-8ca696b37dcd@samba.org>
In-Reply-To: <d994e36b-614a-06d6-385d-8ca696b37dcd@samba.org>
Date: Mon, 18 May 2020 21:30:53 +0530
Message-ID: <CAPkcVAHPa7fpeDO8BoyBdYr2ekNNROD1uM+_55etG0vugMYETQ@mail.gmail.com>
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
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
From: anubhav rakshit via samba-technical <samba-technical@lists.samba.org>
Reply-To: anubhav rakshit <anubhav.rakshit@gmail.com>
Cc: hemanth.thummala@nutanix.com,
 "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 18, 2020 at 8:37 PM Ralph Boehme <slow@samba.org> wrote:

> Am 5/18/20 um 5:02 PM schrieb anubhav rakshit:
> > Hi Ralph,
> > I am attaching additional test case that would verify
> > Create(RO)->Read->Write->Read->Close chain. As expected we see Write
> > failing with ACCESS DENIED.
>
> yes, that's as expected. WHat about the read?
>
> Both the Reads succeed.


> Also, CI fails with the new code:
>
> https://gitlab.com/samba-team/devel/samba/-/jobs/557045164
>
> I have no clue to offer atm why this fails in an unrelated test. Sorry!
>
> Let me triage the failure.


> -slow
>
> --
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
>
>
