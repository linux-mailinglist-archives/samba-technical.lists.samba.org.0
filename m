Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 051475B4303
	for <lists+samba-technical@lfdr.de>; Sat, 10 Sep 2022 01:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=h0Ghsu5aWb19+jw10AN3h0vDGbipLmQJ96eXR/5GADI=; b=Vx42KxAtmFqMR05XO47KJHAzI7
	rveMUW7xsgNKXTLCbK5u4oPRi+wpJxM6vellhPJtkdrH1XkLyIF9Nguy/4t96GpdBx8VaJTHkX+Ls
	Rw8m3roMgB2o1PUwzHWhiRnJj3gQMWmU1CY3k4kmQtx+yCFckpVBWHSWQHU0R+ZIoDHjibyoMbwh4
	v9jdQVpLeO+tS8BAMiA9Lory2RdvGhGph+TNfAWxKlLGIAuzYJ8CI3S1qp8Yihk1gbfTg9jgdxBaX
	R9Qkbb3NOE2MR1Zcte10OrZZ03Eis3ExOWHttyUr+EErq1CRXoRiGg0O+CjLMuH0mc7Dso+7ylPlh
	YSHbj8Lw==;
Received: from ip6-localhost ([::1]:31694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWnHb-000M6E-6y; Fri, 09 Sep 2022 23:19:35 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWnHV-000M63-3r
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 23:19:32 +0000
Received: by mail-qt1-x836.google.com with SMTP id g14so2432555qto.11
 for <samba-technical@lists.samba.org>; Fri, 09 Sep 2022 16:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=nmZtF5n2EKxTnHmP0hGJCYCitYOgyK2+EKBa98cOGJI=;
 b=7Zlxn9/El5h2OUwzwbAhN9KpAWQEJjg1CwckqOKqAW0W6gRFDmIY4aramagNM/+A62
 aqZAb3Rd9+jRo4ecA5nC955qUruYWzIYhjOxoM/feihfaDUiEAqvM56Z/voTlKgSZTSo
 5Uy/xZEdaCNfHM+ZjykfrJXM+Z0rRChEUkq//Amb9emjaFY/Ll0nSb1p805xeGGtUybG
 u56wUNp4bO9ov3O0epduIu6eF5HlFyx5jUOvwiVDz1xNYzDWHapbGorEfgsg+sfG+2p3
 oX2lfwUiQbazXHKdl6raFMkQSVWuvT/PcqoYLVhN5I+MxSJbBDiBBpVvwo9uaJ5BLrYf
 4lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nmZtF5n2EKxTnHmP0hGJCYCitYOgyK2+EKBa98cOGJI=;
 b=YFeuUMQTCVpBGiIc2JdVBlDYbKFVZb2unohPsV0Wvk2Q/kWcnNw2EE0b27iQr2GywI
 UlCnD7EmriBeh6A6X1COoHjYQCjnBqHuScnjFsvmYwT67s4ASY4KOnfhtFJbG8HWTALa
 oZ1Zh8i7tKZlpqGsm8cM5RZKh4CHDP5l4OoWOUc86rIyk7wXCDg+2g4zFlld5tmrgIvT
 ocHp9fpIZPL2Fpq1q5E37Qg6+p54mVsJI24dbIbofSSnANKe7N6FVb5YdWVOVWttrzAU
 HttmDijLOdZkDp9oO+H7Tw78//dKTF8qIuvzyUL/5JsOop2gznSadK9cucnOV3/sWcp8
 isJg==
X-Gm-Message-State: ACgBeo0FVQPsu5mUCLK2X1ZeJQcDDDyaO5ZfjQNZIoGxbQ2vJ0uTrq8/
 N/0WA8Jshb0b//LTmyOFrzZREHVqUJ2cFHF9MWPzaF9VofQ=
X-Google-Smtp-Source: AA6agR40TRiNIb7klLOM8QYXEmY+J5aEkFk74kEHuLtVwIA+nI3qGKbkbQ4NsYnJDMqBOx5YD1XtyAcK6p7NBQpUh/o=
X-Received: by 2002:ac8:5f86:0:b0:344:65d7:ea44 with SMTP id
 j6-20020ac85f86000000b0034465d7ea44mr14709030qta.42.1662765566223; Fri, 09
 Sep 2022 16:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHA-KoPFeH1S6ufMz2HLNjRmjrLMawbKkAw9qns0VEu3UDLYEQ@mail.gmail.com>
 <CAHA-KoMJkYqxBoOafGfc9X+ANi1qbeZvBokyXRyxa6scLZ9aSw@mail.gmail.com>
In-Reply-To: <CAHA-KoMJkYqxBoOafGfc9X+ANi1qbeZvBokyXRyxa6scLZ9aSw@mail.gmail.com>
Date: Sat, 10 Sep 2022 11:19:13 +1200
Message-ID: <CAHA-KoOpf38_EjoBS=wJOWYCzXHzHO7GxepUiWr3FVi2-5daTA@mail.gmail.com>
Subject: Re: Using regcomp/regexec in code - are POSIX extended regular
 expressions available all archs?
To: samba-technical <samba-technical@lists.samba.org>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

My apologies about this to everyone,  A further explanation:

I am a Linux/Unix  grey beard from the early Nineties, so have memories of
the system library regular expression mess from even up to the early
2000s.  After reading various *BSD and other system man pages on regexp(3)
- old messy regexp ABI/API, and regex(3) the POSIX regex implementation
which is the one used in Samba have realised that we can use this to our
advantage.

(Perl and Python and libpcre2 are the same code bases on different systems,
so I have always used these in preference)

My current inclination is  still to be cautious about doing very complex
extended POSIX regular expressions in our code base as there are bound to
be corner cases we run into between the different system implementations.
Please correct me on this assessment if I am wrong.

Thank you for being patient with me.

On Fri, 9 Sept 2022 at 19:23, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi!
>
> Got an answer.
>
> Have put a simple extended regular expression '^[0-9a-fA-F.:/]+$' in
> source3/utils/testparm.c do_netaccesslist_check() in the merge request.
> Found that source3/param/loadparm.c has REG_ICASE flag in call to
> regcomp(), so it looks like the POSIX regex(3) is supported.
>
> Thank you!
>
> Matt Grant
>
> On Fri, 9 Sept 2022 at 16:21, Matt Grant <matt@mattgrant.net.nz> wrote:
>
>> Hi!
>>
>> I am looking at using these functions in source3/utils/testparm.c to
>> check network/netmask and IP address for use with lib/util/access.c
>> allow_access() parameters for dynamic DNS filters for the SAMBA_INTERNAL
>> dns server.
>>
>> Are the Linux POSIX extended regular expressions available on all compile
>> targets?  (*BSD, Linux, SVr4, AIX, IBM i) etc?
>>
>> Been around Linux since the early nineties.  Things would be easier if
>> Samba supported libpcre2, the Regexps for samba-tool testparm are a slam
>> dunk as they are basically Perl regular expressions.
>>
>> Want to know before cutting code and getting it into master.
>>
>> Best Regards,
>>
>> Matt Grant
>>
>
