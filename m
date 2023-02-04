Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9639968A8EE
	for <lists+samba-technical@lfdr.de>; Sat,  4 Feb 2023 09:18:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CXaMqLgqSfo6+hXGISyW7ymweR5YJdr1TbiKl1vt7Ps=; b=nOcQnBISCfUAirZr54ofUm2sud
	rIQUoVgWnUMTjjOUKgpMil3s87tb6c7Jh9Q9y74gpkizkm326yQnYoI2DoNtZe3tuU8c0ZNAR8D1b
	oNOl94XrJe67cOC8mHN3Dyh0SEFUlWC895CulnW6muZc0h+6mconboarjtV47OG4YXWxjzUf4wVDY
	6S8QSOQEJ5kKfJOKJg1+CS7kcRay8fIxNZneUvm7aDOYKedhMZtveCNnyksOc1IYTKVl5c09Ys/VV
	vTRkIWE5oTblWGPWJQ2xjv8ui6QzHpF95cy2DXFQRdlK1u7NXAVBiU9yz5yWwuPyXQ99OvU5giGVK
	AtIRCNJg==;
Received: from ip6-localhost ([::1]:32108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pODkS-008i8r-PE; Sat, 04 Feb 2023 08:18:12 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:36495) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pODkO-008i8i-7s
 for samba-technical@lists.samba.org; Sat, 04 Feb 2023 08:18:10 +0000
Received: by mail-qt1-x82d.google.com with SMTP id v17so8046445qto.3
 for <samba-technical@lists.samba.org>; Sat, 04 Feb 2023 00:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ab3yVySz0dJJ92PpZDbVdNQoIiap3PQIMXh8KR33VI=;
 b=WquJlkjGHjtP6P5C/agCXOd1djTltiCdIQjN59hXmJwP3DX19EJj2LowHPrCgTDz8k
 ziLyv4sO6CsMGk8KcsmZvfpWMvC+FAYOkjonQQnYHrWeHuwQ4SdDmW805RZu/Midr1Gg
 /WT4Zq8pU8RdpKVr1rTeyUS4DzQfQ8/XfQkQVzlA/fgxqPaJAibnwayIYYx9FBcHMhTh
 EWhIf/rS8a4gZB6xnAx4dqpBvBotjR1/5dV//H+wCKrtCW4Rge35KEfRVT4DQ/1QklXb
 ufR9CVL01O6CWFIMeWcvYUV+vj3SxdQjE7aF+PQSso3na5s4KH6ctq/HqxfYeclwtcDY
 Q2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Ab3yVySz0dJJ92PpZDbVdNQoIiap3PQIMXh8KR33VI=;
 b=xcuAcrYZG7/Z4VBDVLOfDFhGRxrYxpsvhdfq6JgNDX1FijlmGy8lFMQikoB0vYHz6m
 cQvy9GCxZUs4YqxjkC6T28amYSqEADYcc6QrWLcwMIJdSill6oePT6+fOMwtrUnRWbQl
 F/jVBHO9UW5KU2RoHilW0lfjqSTeqbyMtV0kdTMLhlXqKdcAfsuQ6go2YMYXO0zuWKx2
 Zvbq4f73Yiy4CFG6lpsXFC+YKmS5Uthg77GCxpkYGRSObyLDBSC1ZaYJHMCPP5PXrTky
 OJMrMjwePDF0u/wqSDzFwr56BLPwoaoqZPGhitoTOxf/vfp/fJ9bZ5U6caAXU/Jm4+Rm
 Tq4g==
X-Gm-Message-State: AO0yUKX/uz92x62TH2YwBAYJAOvKvhCyKF4RlDmPwh8rPsHN39BoKbA1
 vnzmb6TSi8OMhQ5UW1tT0osvSIIMihJEbrLlwUdhNrUP
X-Google-Smtp-Source: AK7set/yMXkg1iU4E+FyyPWcap5HHUrM5C+YjZ84gyMTFM78aIyQi8s4WcUZW4i2/7AB6bEQWfWoqqDBd8UNxNSv32Y=
X-Received: by 2002:a05:622a:1304:b0:3b8:50b0:e36 with SMTP id
 v4-20020a05622a130400b003b850b00e36mr1245727qtk.152.1675498685037; Sat, 04
 Feb 2023 00:18:05 -0800 (PST)
MIME-Version: 1.0
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
 <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
 <Y91JdhAtd41n9C7O@jeremy-acer>
 <48083804-dfef-7348-7e8c-9bc10fab9db3@talpey.com>
In-Reply-To: <48083804-dfef-7348-7e8c-9bc10fab9db3@talpey.com>
Date: Sat, 4 Feb 2023 13:47:53 +0530
Message-ID: <CA+RDaRAUAhjM9CDuJz13HKt9GcbDhMR-HW3YPTpWuMGPLQU-FQ@mail.gmail.com>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
To: Tom Talpey <tom@talpey.com>
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
From: varun mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: varun mittal <vmittal05@gmail.com>
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Nothing fancy, simple copy command:
robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder <file-name>
/COPY:DAT /R:1 /W:10

On Sat, Feb 4, 2023, 8:05 AM Tom Talpey <tom@talpey.com> wrote:

> On 2/3/2023 12:50 PM, Jeremy Allison via samba-technical wrote:
> > On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal wrote:
> >>   I was able to narrow it down to the "Named Streams" bit in
> >>   "FileFSAttributeInformation" response.
> >>   When this value is toggled from 0 to 1, as is advertised by
> >>   `streams_xattr` VFS module, Robocopy
> >>   switched from FILE_OPEN to FILE_OPEN_IF.
> >>   Thanks
> >
> > Thanks for tracking that down. What strange behavior.
> > I can't see why having a stream would make the open
> > change to optionally creating the file, but it's good
> > info to know. Thanks for posting the follow-up to
> > the list !
>
> It's not the presence af a stream, it's that the fileystem supports
> named streams. It's getting that from a FileFsAttributeInformation
> on the root directory.
>
> Robocopy has a very broad range of OS- and FS-dependent behaviors
> and optimizations. I bet there's some combination of its 1000-odd
> commandline options that can change this.
>
> Varun, what exact robocopy command are you seeing this from?
>
> Tom.
>
