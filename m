Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1119503
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2019 00:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hcHBaix+7npfTXEyMz3ZRD2eABjn+HM9TF//RD3/0BI=; b=uz/lO7ioYCVcYNUvMcpNXf7zBP
	VLy1UfN2zQIhLuALwKrHXAKd7pumQ0sfrVgqDaI97VGMc9Wf385uMBiVRsLUu+3QUCLSoXOrw9B1B
	ycOkwYTgmrx7Q+fXIrsbnTaIJYgE9YoZZmK6nxXs1e9cX/elURDhD4s2O1lQ5wuwEtV8jZm4wqt+3
	kPEYcWQMrnwBye0B5jw5ufOrZJrxIBJN1DD8dqJbiT2FaLtR9KlAGlBef27XP9CV0NoPzAAx8L0+m
	is5DlZSWckKx2NiRhQXAUPHKL8lg422ILYXweYNLdrASnWSfaq4VF1Nrn7Bpb+T8P/Ec0sSIVAkYU
	CPZkqAaQ==;
Received: from localhost ([::1]:58468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOr4s-003702-C6; Thu, 09 May 2019 21:59:46 +0000
Received: from ozlabs.org ([203.11.71.1]:40743) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOr4o-0036zv-0g
 for samba-technical@lists.samba.org; Thu, 09 May 2019 21:59:44 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 450S1D6Bxvz9sDn;
 Fri, 10 May 2019 07:59:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557439169; bh=hcHBaix+7npfTXEyMz3ZRD2eABjn+HM9TF//RD3/0BI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sxqhC2rj+IcZ3jRURMNwHLhlt0vRu8o1HcQBQMROUve+YacpdyBfCJ/urTLInW1Oh
 oD8PmMn3bHZBEFdgMYyFydBzHYtf9Zsg+bKc/fs3t0J8uiZnFwSLTSHrHkMqfeaOwK
 qdmgX0A0SHB9xW/XlUCxi8HT2lcpZZcqQc/7UK9AmyfZUFnkA5LGLiQSrtfhM8UaLh
 sUocqlvaZ4YCnW6zITemEks6bgREgmdWKwDGxjycBgSxbj1wAOx5gy1HAFK5TnXdxo
 j+KxcsLRr5S6cfsaVdJeTm7FPgQBRqzdDLYsKjJGmdn9mn+GIz0/aIs1VEEw+zoZs2
 xshksKBuz/+OA==
Date: Fri, 10 May 2019 07:59:27 +1000
To: samba-technical@lists.samba.org
Subject: Re: GSoC 2019: welcome Mairo Rufus
Message-ID: <20190510075927.393c3c8d@martins.ozlabs.org>
In-Reply-To: <20190509131420.17d98c62@samba.org>
References: <20190509131420.17d98c62@samba.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: P Mairo <akoudanilo@gmail.com>, David Disseldorp <ddiss@samba.org>,
 =?UTF-8?B?QXVyw6lsaWVu?= Aptel <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 9 May 2019 13:14:20 +0200, David Disseldorp via samba-technical
<samba-technical@lists.samba.org> wrote:

> I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
> Google Summer of Code student. Mairo is assigned the task of
> improving the smbcmp network capture diff utility[1], and will be
> mentored by Aur=C3=A9lien.
> Please make him feel welcome.

Welcome Mairo!

peace & happiness,
martin

