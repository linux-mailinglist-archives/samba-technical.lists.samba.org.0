Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEEC359940
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 11:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=snOwFGwNqxg6NNO6inczdxG8FOFVm6HIG5BwhGVvvqY=; b=YCpt59JLthR+Oo6MLnbVxZstQb
	uwbdxELZgBApLp4emq2TymZdIrfnWdO0+DZ7sDQMBnW011ccG6pIGaN8j84wVdjJ5kB67II602mA9
	14hmJAWZzKNK5j2OwaO4R8SGRG4rMBCpESf8eML7Y8geOMXAcZwaMokmKUAKrpV2pkb1yYYshf41m
	ZGa+0QR87DzAfhsyC9cc7aBA7OL5h7utX9acEnF8YfPkFx9icZRAYwLc7DU6aU4oTsWgiuAkFhB+N
	1ye7wmToWMlmt4F+C1g8jTohMRq4YmGD/Gzntg4FUJXPYa/j/GvVSTsaWcyvoj/xAeI4rctofCUTW
	ZQ1X/+4g==;
Received: from ip6-localhost ([::1]:58242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUnTx-00AdP7-9y; Fri, 09 Apr 2021 09:31:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34803) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUnTr-00AdP0-OG
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 09:31:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id ba6so5763719edb.1
 for <samba-technical@lists.samba.org>; Fri, 09 Apr 2021 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=snOwFGwNqxg6NNO6inczdxG8FOFVm6HIG5BwhGVvvqY=;
 b=MOUMZPWJkaohxlY9LwrQNAzrOZ5LoS5842Uc4kQPcTsGMMsK/tjbaCiI590PUds2H+
 ti6sgTXCmT2th56nZN0Lwy0RsKXZ7ObJNhNJeDlkp/mqtgMAnXh+/uZFWvsU89N4CaAi
 JjESOREFKU1RvLqMXDmJAqSpEG3acbKtO6Yt5BvIBfKT3vZglqWNejGPhdHnl1engK+j
 npM9JyfOHm9V1T4QqaH3Ea2YcaEgQ+wz792j0sysO38VhiiheFk7LIgGL/vPVhrS1aYC
 n5dX341SvXCKx+xo5issS+gpqGGzbHKS/ak7Pv8VUODv/mxiyDBcTiB/S6CrtFPerl7z
 B3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=snOwFGwNqxg6NNO6inczdxG8FOFVm6HIG5BwhGVvvqY=;
 b=UQnk5BNPVK3yHDduMbZyr+Id9x8IATWhBF1QFFF1c++UP0b0fpMtkyvCBmqmgc2HxT
 yMOLsm1Rd28bC7XYTcyazI8lJYnz3NTOCnBl32JvXvvw2aSiQI6UjeMXsjEQrwC+ZF1Y
 Ci5AMQ4eTqjhQQcZ0KgOJ5p4TmqjDc+rZmaC83GqeYyPU0bn93PyxuD04vuBqyAXlYio
 yfo3ZgA2OoSRxta6b6MS1O6gghg8GfJKNqQ/GxrVwa/6icJ03Ze6Mz7N5+kPUiPeRLyk
 vLAQ3oNsC3jY4q1H1MfJlEZuDOmrdZZ3SPrTpTyUJhnR8+OO8CHGGrP2lWG4HTDx6yaB
 tcEg==
X-Gm-Message-State: AOAM533uRJZDBPpFlgFkR1JrMu+roFR1YXAXQpGwbPh2D6vIdes+TRR3
 N/3aYeYAVdGJ7cm0QEREopnUd14A13tHHLyUtAE=
X-Google-Smtp-Source: ABdhPJzZVLmR73GRVqdknFAdscAzWMOkk//ZKcrDyjgYsGyxAxRGx3iCMVZHj7MKaZEy0yqoiWuCKIx2eUz6UZ9nNrY=
X-Received: by 2002:a50:eb45:: with SMTP id z5mr16747193edp.243.1617960671024; 
 Fri, 09 Apr 2021 02:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org> <874kgf4xku.fsf@suse.com>
In-Reply-To: <874kgf4xku.fsf@suse.com>
Date: Fri, 9 Apr 2021 19:30:59 +1000
Message-ID: <CAN05THRmAVaoJRooS5msNUU7zk3wYRoVuEDGyV4=9N+Ky953Qg@mail.gmail.com>
Subject: Re: Setting up QtCreator for Samba development
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
Cc: Igor Chudov <nir@basealt.ru>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The answer is emacs. The correct answer is always emacs.

On Fri, Apr 9, 2021 at 7:29 PM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
> writes:
> > if you're open for other IDEs, I've recently looked at Visual Studio
> > Code on Linux and that looked amazing. I was just about to dump my Emac=
s
> > setup and switch but then mehhhh! :)
>
> You have to resist the lure of the dark side ralph :)
>
> But seriously, what did you find particularly amazing? Does it come
> builtin with good C parsing/analysis/xref?
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>
>

