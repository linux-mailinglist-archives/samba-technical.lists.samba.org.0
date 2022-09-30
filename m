Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A45F0274
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 03:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9bsMyEMv7iUsQzbSPZgns1IhpM7OYWvNJloaQzfhZoY=; b=OMW3oj6xtZe7uEk4C6UbJxojBa
	wL3zK8Xgx04iR/kzYIedgfG2fwin905ctHTlCHz+mp6+SxgJO4MOKuOb990sBrow923Ajv4FgCqGI
	wD4jxfJJSnfoPqTvTn1r5e1odUJJDxJ5kZL80j6iBixhq1DB2Px9dkI/iSO5pZRHeSEQYLQyajHth
	27vKZcQn+ejGcvhn5WKjG8WLVdtA8fpg6qOzvP5kULGejHESan1lLcB12Ihm0OhVOrppY8i/F53VS
	WSNl5iGCwt4hz1POgnrQ8F13A5xrry7isJsjXPMoAeQfEAHY8/pI7LX+zLEH9JHFWiW5VyFf3ws1p
	qEXQSqNA==;
Received: from ip6-localhost ([::1]:34892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oe5E0-004uZI-1f; Fri, 30 Sep 2022 01:54:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34595) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oe5Dv-004uZ9-56
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 01:53:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id s30so522293eds.1
 for <samba-technical@lists.samba.org>; Thu, 29 Sep 2022 18:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9bsMyEMv7iUsQzbSPZgns1IhpM7OYWvNJloaQzfhZoY=;
 b=fenawfipOPFT0kCsfwvUz5QgWMgxNvMCqZdls+f4tX05MiLHnYqCZLmEYQax7RgdqK
 YpyIpIBlMaiF7ootHpNN9eYvvZgR5E4UgDISBwyBnLMxdGNB9V1TmnAjUDUjsrprdqT7
 A8b7Tcr1+vakUNBsv9PNDTaPmBz5fCBBXHCtBK03AbtWbpUQYUAr3Q0CbYDv4+5ss9K+
 QmoZPKeOyOYRbtlrQt1Z2Zf+BAkHRYz2zV9WEx40d127Qygl0bHbIjhLOcYrGchDP/xy
 h97QBukoXxZ5W6fHwnL+iXhSbsVS4+L0aGdkQ0ojgWXAdvUu6yh1+V7RGgNkdMC9dKMb
 e33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9bsMyEMv7iUsQzbSPZgns1IhpM7OYWvNJloaQzfhZoY=;
 b=01sITQmcsOU9wntziZkX1TqXm2dRkz7yiz4DOwk3v7U4YhKkCwYVIRj432Hio+xt/k
 O7F1x4eXIEHwM9AjxXwLbaIcYpwxFtrfsT9Xj1qMENwzX+MyBVbmsu4q6Kj9fnzyef/M
 EnHlEgWtnn4nfFfBBAJWl5K/crlsTklh5bSmvr32VK+rAa2aX8amSsmblrzGjduiOtdt
 zAFrVZ03DPvn/a3Lq8yqJymI1peg9I8ZN2AoBGo2cReIh+O4X4Jtd3q9OzJyWYj3FN9V
 Z5c6H/6SFd6Qm1mGThHBAnESc0SEY2lBO9M6FMaeg0vbTgmmcNSbQwqyo6Yptyn11QWX
 u1tw==
X-Gm-Message-State: ACrzQf3Rr/Pqjq/7MQJN3yijYK2u0Lt/ddayVl1Tsj8Z3iVpBmHfo0w0
 9gJBYZkEe6z4c6ZV5q5x8eHiTzwg/DP5rLTUnJZvVWKHRBQ=
X-Google-Smtp-Source: AMsMyM6tcQ70xlwUyQ6rjPzAAOCCOD+uxRCk+oGNgF701HPv+XNkLOlPT5kPDuvF9zqGNUVu8T2Ay8P7itAGtuFU0bI=
X-Received: by 2002:a05:6402:5162:b0:457:6ef2:df3 with SMTP id
 d2-20020a056402516200b004576ef20df3mr5814376ede.128.1664502833890; Thu, 29
 Sep 2022 18:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
In-Reply-To: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
Date: Fri, 30 Sep 2022 11:53:41 +1000
Message-ID: <CAN05THQKM_UvvHGcNVexgNNZmPHvwezdiABPU1F=vGp5CaiCPA@mail.gmail.com>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
To: Andrew Bartlett <abartlet@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 30 Sept 2022 at 11:28, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> I've been trying to chase down the CPU spins reported by our users in
> the writev() codepath from our LDAP server.
>
> A private mail the the strace output shows the sockets are in
> CLOSE_WAIT state, returning EAGAIN over and over (after a call to
> epoll() each time).  That alone would be enough to keep things
> spinning.
>
> But they are being shut down, however our LDAP server won't be
> triggering a read any time soon, it is waiting to flush the response
> out.
>
> Technically even after our server OS has got the FIN, there is
> potentially data in the read buffer (so a read() might not return 0
> anyway), but perhaps most of the time that would be 0.
>
> So how can we detect this?  Can we at least put a timeout on a writev()
> call via tsocket et al?  If so, how do we do that?

Do I understand this right?
Your process has a socket that is in CLOSE_WAIT state. When the process tries to
writev() to this socket it gets -EAGAIN and not a more "hard" error?

I wonder if getsockopt(fd, SOL_SOCKET, SO_ERROR,  could be useful here
or would that also return EAGAIN.


>
> Mailing list threads:
>
> https://lists.samba.org/archive/samba/2022-September/241869.html
> https://lists.samba.org/archive/samba/2022-September/241873.html
>
> Andrew Bartlett
> --
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
>
> Samba Development and Support, Catalyst IT - Expert Open Source
> Solutions
>
>

