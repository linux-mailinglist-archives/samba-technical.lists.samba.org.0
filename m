Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D257220975C
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jun 2020 02:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=K5CPuO7Y4bbfnusCVtMTkoMSkfTs+ukFd5Dc0fdfS1c=; b=4W66TcmsFihkihNCXvVtysPkpg
	s1MIvU3uUdBHtLNfoZF6V7dxDie3DHffaSRQQBburfhf+syZkAvEoW2c4OaQuq2hWNiA3olq7bbA1
	FIi2QV/NcgwmW6jMa0XpbZDGO2zrWytR6XIdxYcUXr1xDg6d56kP4mP6w9Qdx0pujhUtaHHQjWe/F
	i3RXFf/XthKqfYAvosov4XD7AqBFtR/N9PWWRmSe6KbludQPFgEn9Pcr2lKSVVdhjDqtEUxnMHbfK
	r7j3xjJFtfRggkO2JexiHR5LW2O9cQUTveVEHFFdUJxT3PGIGUrL4y+lodIuoXUnIPk6UWDS+LZLg
	hkjuyzkA==;
Received: from localhost ([::1]:53300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joFRj-002DJE-Cb; Thu, 25 Jun 2020 00:08:51 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:46565) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joFRd-002DJ6-2v
 for samba-technical@lists.samba.org; Thu, 25 Jun 2020 00:08:47 +0000
Received: by mail-io1-xd32.google.com with SMTP id a12so4161719ion.13
 for <samba-technical@lists.samba.org>; Wed, 24 Jun 2020 17:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fnIJ37PdO9eRm5kwOiEmBqAR2VZEFqMizW2lPw7xd58=;
 b=GcdPVkSJ04PCXE+gFr/gTraO1Kha4ByScBNJqY2uA8KeOpcd4va8ZcuBY44lRxPieX
 VvUwAYHC+LZd1Tyy66Knx4Z0PsCwOOe56b5rMyWpPDRsonRoAIk2wpWqzBj6OZpGJ59P
 CUfvoh8FhYmeWQh+2ZDteEroMPcNV0s/sg+Z7bGgTaru9d3VfIBbtyhDdJ/pqnKt5AQE
 DGMJEciLRiuvUZ6g9gf8xaLwfPcwMcF69QBqbgNbZW+X+BSrUeOwITQW9i+Zp1h3wjvZ
 Wa4rlC4YDMTK5ItrVttgLy2vCJDaCrrIOtuY5/udYjSq+U2RTEF1CEHg5EG7H2qdqxGS
 ehTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fnIJ37PdO9eRm5kwOiEmBqAR2VZEFqMizW2lPw7xd58=;
 b=aeoHsP3xtO6eYyvsAVGKopqmds3Z4Uqr7I+NBw7Vk7cmZn8CwzcFCS0geF42GII3V3
 Vl1eOmWdDtcNQ9lPfkm5vaVlswzDOqokJfAB12Yy270gT3kurY05NIB6eIuNtjCN6RIS
 apgeSZRqUQwFQQ47O2jILxrZO3N60ng9eL7WUWk3g5olpr+JeytILVsQBpSI658D0uow
 c8xFJ/jjJukxTXwgn4dkdWFsVXQVRL6Gll68kt6HzSW5/7F7GH7N4F6FgO+gOjklmf6J
 W2qx70AJ1N67fLhYnnH/6ooUgCvyOsgtaB4UZzYD4xjYsmHJu0WbYcNpv614EvDX5W9e
 /Cyw==
X-Gm-Message-State: AOAM530N9PZixWvc+VCgJ83DII1UazZUvucijktO4CV+2nx1tj1auFtv
 pYcB2BxKmvyXUFAQjD4/XsVTtxcI+DkrNN56WrQEJ7k5
X-Google-Smtp-Source: ABdhPJy7nIqOz2bmETSwCYWrQvtolxDqf6/HDCaTHcmXSbTyJCjV6gy+YYOXQJShcAfHAPNxUkkTShFB2Fm/NYLOz9U=
X-Received: by 2002:a5e:d507:: with SMTP id e7mr34036770iom.132.1593043722695; 
 Wed, 24 Jun 2020 17:08:42 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 25 Jun 2020 01:08:31 +0100
Message-ID: <CAGYhc9=M=u+5aWJHvDZ_H9ZqD0ZuE8+1vyo0iGSMKSjSvFPcfw@mail.gmail.com>
Subject: ntlmv2 via ntlm_auth
To: samba-technical@lists.samba.org
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
From: moore chestnut via samba-technical <samba-technical@lists.samba.org>
Reply-To: moore chestnut <moore.43132@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have been testing with ntlm auth and winbind and would like to confirm if
NTLMv2 responses which are extended in nature are expected to work via
ntlm_auth or via the NetrLogonSamLogonEx method in general.

By extended I mean, including a long list of attributes such as domain
name, computer name, dns details for DC and then probably some of the more
interesting ones in relation to timestamp, flags, restrictions, channel
bindings, target name - which are negotiated based on the flags during the
NTLM handshake.

I have cases passing that are NTLMv2 responses but only the domain name
attribute would be included along with the blob.

I am simply using:
/usr/local/samba/bin/ntlm_auth --username=user1 --challenge=HEXSTRING
--lm-response=HEXSTRING --nt-response=HEXSTRING

I'm not sure what the restrictions attribute is, but what about channel
bindings for example. Is that enforced or ignored on the AD DC when the
method used is NetrLogonSamLogonEx? Or is it likely to be something else?

Happy to share more details if required and would appreciate any advice.

Thank you.
