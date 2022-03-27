Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D674E88E2
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 18:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0G8IzW0qm7pmI5Kr5L2MjoswSYxbnG4TEA0B9BQ/ZqM=; b=E5e4PeA5H2m3fjhQ180Kv1+Nw6
	0FjDfdsE8580rhiJJhPzaAxnfe+i3SkOwNlXdDFZskeUfEiF1CY9I5Ikwa7LGaI6h+G+JK2hF3RLu
	/r6oaP+WiVRbu9ctMi/2L1STWcbMrJOGaACw6i6kvYDZhObbS6cs8d5AqHCvox8kqu2KQhyqKAlYj
	s47tUQowwlNvg9yDn3m4ipmdjq/EpM2NElN+oOkmKa4pQaVp1tks0La9KUB5JGhDdrEYwND2hWnAi
	qE7zJ2ImySCq4kK+QvURFw3Gx54H8tTdkZtebl0ss/PK1voCP43oJHusJFAb+GB7ygW6UXV/6drZj
	JZy7WA3w==;
Received: from ip6-localhost ([::1]:18332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYVsU-005iCX-4G; Sun, 27 Mar 2022 16:36:30 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:42507) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYVsO-005iCM-Ur
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 16:36:27 +0000
Received: by mail-oi1-x22f.google.com with SMTP id q189so13319579oia.9
 for <samba-technical@lists.samba.org>; Sun, 27 Mar 2022 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=nAHD8hNm9s0KSp44DdWq+9k73O1VteidbPZo6jrcMOQ=;
 b=qgS0yNWyowecXYYHtupjZWfR/RwKapomEC6+phNZbFFW0C6966wfIgC99xW88MbJKK
 jUVSJdSBlIhX+Fus7PJTfVU+opAy7NQbhnuKnYMSuxXNosdb3prne+bzdSq57+JRfYk2
 Egm1XBca2+VBcXTMXrVGj2cu/aB0LJv6g346wf+aJ+oYPl/9FciBVDYH59Q6nZ4bQpkf
 sWVfi1uZj3st5zLGXlO0tTa8+GlC58Q7eeXgDuItOfIVVXAtfRbb0F5Oo6QoM42ZdiFF
 SUGrInixAqV+PSJ+WIcIeM+cWr5GMm7SljZ5XtyxFHz/St/X1TkbD0uZ6jF+XDxBDXy6
 UOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nAHD8hNm9s0KSp44DdWq+9k73O1VteidbPZo6jrcMOQ=;
 b=J68ZePmuVDTvIOLKgu88GYH1uvMxsQLPJ5epjnXngcRXQngXBRE1TiRlsih4TcKKXt
 dQKsFt58wk8KLGh6ozkCYhEuV2hhCPCLT4Rb3OSQ1TkBLYVfVv+NgHKgYWeYQAG58uHL
 AbsV+K6VBB3hKp7UBDlPGfyvxM1cyxl0IlRoLh43+0gEf58+nRKJmls2cSWfjFRnWrMI
 zriimGf9JE1V/IV+epb0XrA2+97IMs97pjs6UjRoCCD96K7pTHvLqd05PKKZiXJ6RHzq
 UyKyMQ4OqxrbrvbHhFw+rnWzrXLkFWxqn2cQ/A4J0IBA+urBFfOaXT9NXnREqt4ZcGcD
 bGgg==
X-Gm-Message-State: AOAM5307Gpbg1rBff+GTkhVVFRSMpgWEm//sNYhgJ0WiB4jSRDcB1N7y
 PNKRoVJLg10GnwM7bqqkQIR4hR7N+DDYwfRo63bf2li7cQ4=
X-Google-Smtp-Source: ABdhPJwKJBKKCHCGFTTBYkQdmhx32GrNe1GHG2jiFJ+YEzXBQx1HKIRNc2rYYi7z+bmeBcywIgxlPmM96MSSMwJ5Uxg=
X-Received: by 2002:a54:488a:0:b0:2ec:f48f:8eea with SMTP id
 r10-20020a54488a000000b002ecf48f8eeamr14338169oic.166.1648398982455; Sun, 27
 Mar 2022 09:36:22 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 27 Mar 2022 22:06:10 +0530
Message-ID: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
Subject: Regarding Mac os behaviour in samba domain
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
From: Prince Chaudhary via samba-technical <samba-technical@lists.samba.org>
Reply-To: Prince Chaudhary <chaudharyprince64@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello team,
 I am writing this mail after spending two three months on understanding
samba and implementing on mixed os environment (window,mac,linux).

Samba domain works fine in case of linux and windows system,
But in case of mac when i am joining a mac machine to samba domain it join
properly and shows all domain users as well, all ok, but when i restart my
machine "other users" option which allow domain users to login won't appear.
I have to relogin in local user and then i have to logout then other user
options appear and then i am able to login with domain users.

Can you help me with this?,
Why this is happening and what should i do? To make it happen all i want
that other users option on login screen of mac os machine should always be
there whenever i restart my machine

Thank in advance
prince chaudhary
