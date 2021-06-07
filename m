Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B990739D440
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jun 2021 07:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Ux9b6pKofssgPngbFQZkMrhzri6t0doO004aSSzj1Nk=; b=DrivLFEb5r9gqwg6wzu6F5IKP3
	kW1bytk46BnxqAGscVgQAxdH+H+kiSQWmNputJJtsDtVNB5Ywno2k+zGPO542TemzFpuhPztkORVF
	C8AEZg0N3p47PqM0ICEy7S7VY8HG4tY+U39lL7U6l2+3Hahb2EpRrXwEz/r6gf6G1H2jdwNDolmU3
	aTCifp5hXvBtwu52bCwmjY89fTOjwNWdFbuEIU3dI7luX/aw6QnZAPAFXZo5RQ0AbS2zoKC31woWr
	GJcpWkvpyXI7pw9oDW3GgMC17rq3eNUDC+05X4Y7AsyBJUSjsnMJgEbqVDqZ5VZsobLuEvZYWbgVe
	r0b31qew==;
Received: from ip6-localhost ([::1]:59834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lq7Uh-00477D-TD; Mon, 07 Jun 2021 05:08:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46244) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lq7Ub-004774-HI
 for samba-technical@lists.samba.org; Mon, 07 Jun 2021 05:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623042482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ux9b6pKofssgPngbFQZkMrhzri6t0doO004aSSzj1Nk=;
 b=bixwqgYwYWgp6NCHr2+yCY+2WnidkNWPlurGPBpOxeC+FExHCZQ0HXVgp2/oba1JO3F9f+
 uh5l8ZAm7UR2oXf37JC4PGdCeXbR2EJzvMrRqWOOHx7dYbhWGnxo0BrtJkkEUMhiaSh4GG
 gP9e8vOypVQ7qwM5k9nNuyWg0edcMFw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623042482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ux9b6pKofssgPngbFQZkMrhzri6t0doO004aSSzj1Nk=;
 b=bixwqgYwYWgp6NCHr2+yCY+2WnidkNWPlurGPBpOxeC+FExHCZQ0HXVgp2/oba1JO3F9f+
 uh5l8ZAm7UR2oXf37JC4PGdCeXbR2EJzvMrRqWOOHx7dYbhWGnxo0BrtJkkEUMhiaSh4GG
 gP9e8vOypVQ7qwM5k9nNuyWg0edcMFw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-qubM07UUNtOR1qc3mwsxdg-1; Mon, 07 Jun 2021 00:52:09 -0400
X-MC-Unique: qubM07UUNtOR1qc3mwsxdg-1
Received: by mail-io1-f71.google.com with SMTP id
 n1-20020a6b8b010000b02904be419d64eeso1132381iod.6
 for <samba-technical@lists.samba.org>; Sun, 06 Jun 2021 21:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ux9b6pKofssgPngbFQZkMrhzri6t0doO004aSSzj1Nk=;
 b=g8JtQJp6s1sy2lZpt1DlWhZNbniQeZCAo/Om6G4UkSt8lfpOw1epyxh/vupoqs7P5L
 iGUq9IMNAxUJ3yXfkyoFd/AcYeNQzhlQUPowhKYOJ9ZJfVlTyP0mxXa5uME6KWeRSFJk
 PUMzc2GHJ4VdaVCVnKJm1cImGIZCAcVU3amjBYJCTHlMJM9qKjktvB+S+RMsCsXu0eSs
 5PppeQUu5878xTbkFOd2kCU9DyHSNgO0PO/UMtzSUN88YoCiG9M5thHvVo5vOal87tFh
 3Xk8yZ1mZbp3AT+c9YrKZoZXWmx2BfMr6rIaK9LVO7umDdbF4xwp9xfolQI7IyxCKbhe
 o9UA==
X-Gm-Message-State: AOAM530YKfcj376bjz4MwG/7dPqzKJ+cEU4gmWI83kaOaLrLnpgsREWe
 q81lJBaolUKknCSv6XgDsVuIQ18KpBH8HZ7DrNVzlRYWaGrr/qSXsJRDMcC+xydQOOmFdkxVpAM
 12uQIQ4ssp6OzbctDYr3L7JE21QT6mzgNVjTiPYBeq2Jd
X-Received: by 2002:a02:b805:: with SMTP id o5mr10371477jam.110.1623041528348; 
 Sun, 06 Jun 2021 21:52:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhJ5Wr8IchKF7PQbi/FySJoAEmMzTwDVZf8lQDVlJYgzyEil3oKucnXjBjNrNfBK81pn64HZKxCMiUv/Ob2qg=
X-Received: by 2002:a02:b805:: with SMTP id o5mr10371462jam.110.1623041528097; 
 Sun, 06 Jun 2021 21:52:08 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 7 Jun 2021 00:51:32 -0400
Message-ID: <CAM5jxn-zkzoAh-sL=e-hqhd+Yi-GivqwdR9JYFiaXK+gMBnNHw@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: samba-technical@lists.samba.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rtalur@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
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
From: Raghavendra Talur via samba-technical <samba-technical@lists.samba.org>
Reply-To: Raghavendra Talur <rtalur@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> I know we've added JSON output to a few of the CLI utils. Over the past
> year or so I've added this to various utils in FreeNAS (using libjansson).
> Is there an overall strategy for this? I'd be happy to upstream what I have.

Hi Andrew,

I am looking at adding json format to the smbstatus output. I don't
have anything working yet and will try to reuse the json util
functions that you have in your working branch.

Do you also have anything in the works for smbstatus?

Thanks,
Raghavendra Talur


