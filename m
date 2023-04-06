Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A90BB6D96CE
	for <lists+samba-technical@lfdr.de>; Thu,  6 Apr 2023 14:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=548kDFj4gIoUugd5f3FYvuQrAA/yoYohbrORtH8xrVk=; b=ncPLveyUcNSV/0WYeUHjou9ZlT
	CMBn9rXyvdxTOJs5Xmu0hPgQuUn8zB5bSLjgNljYL+sAccREHfEKV5ApvCAjv8bNYmnCa6znZqQom
	hO9Vt5mtKPcu00Rs0cUfWVhBnxMBq2WlVM+O461N5O+sVPJwmQl1/ffY5o+rmSw4MpN52d9R42fXd
	UlnqVNeKxATMRzHLciGKkNw4HO9EsAXyCQrtCMx/7pIXxNqK0VWO8X/cUUS7vv9xSOhufJU7CAgFg
	SGLbwnprtRh9DbF5eiqid9eGEmJr14l0sO6RgUwE5+ibAQPvBbOac/pNvkwTqLA8HIj8hWFmuKRk3
	D58xXNfA==;
Received: from ip6-localhost ([::1]:47396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkOQx-009euh-5d; Thu, 06 Apr 2023 12:09:43 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:55422) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pkOQs-009euU-Ug
 for samba-technical@lists.samba.org; Thu, 06 Apr 2023 12:09:41 +0000
Message-ID: <8219c3dd87179df545fb6de4b89b2bbc.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1680782966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=548kDFj4gIoUugd5f3FYvuQrAA/yoYohbrORtH8xrVk=;
 b=WG6MoNIYST3leO8UG3+SBA1KImJjXJHiBms2FEDzjWadFiVyAuuFk3OicXaKSfwuZtHn3u
 bqS6sDnzoJmjn5JhW0rXbD/1VmPPXqtSJGwLBYEuPqNq4axcIpzZw36sh/WFDlzhJcSxNl
 5DBcWlFdMZZTAo9zFK/HtZ8/1mLx0HKsARVyrnvd4OauNAhQTC6lS910tZYlBdXdaHuMa1
 gFr0nW6ZCsgCQcKQkpEduGC8m9Ocac+WZqCCizZbp/PqUMhOLAMjVR1z1CTQEB1kGraWm3
 J7YrAVLnluy6pWwh2YBBWtNIlBYWKEObedkV2SCx0XYGV92HanF4LrX4Z8Jp+w==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1680782966; a=rsa-sha256; cv=none;
 b=X+L8UmhLUdRCBAw9MWHAqu6ulQyTRO1vwEhwH4nMhXOY50ydAUQbV79F8R0krcT89qEq/e
 sAhoVpan6GKLt1OWmZpfPfXst20ouAzbbEOvzY2W+vropoxvtYaVqycd+DLBlNw64kp/zV
 QZdn9uwYphChBpz836Hh3cKz6lV5FGtyjBgJ6738RSClmOtg2VOwMeeXQ9SBfqbc40uSP7
 ADzqy+rEisk421OWhVmi2sQ83zxi1P3c/ggm2uj6fdwMXS6+SzBrYuF3rf/6LkJHpOhMty
 MpISUdKw6RD8VXXq4T+DdADeAZPpPu/R8ipyq4JmOPRVATu5C8Io1ysW0RnR1Q==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1680782966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=548kDFj4gIoUugd5f3FYvuQrAA/yoYohbrORtH8xrVk=;
 b=c4FeABY1c2gOAKYwLkzF0oDm8UHzqz72Q5G9vlCPwdcvI0VsuuRFVuWcFjX5YZ1nVkV5cj
 nGo3qoG5a0j+b1/FNnHg5M5QqXbuXAGRWVIR6KBZyEtzWOzOnSUM7Mz06nnM5HMTr7he2Z
 e0va26ZyVMdfqLHtFrZuHzVeqAcNjnomKMg91YXDogjEJUZSVaSd2W2sIqQo3mg5Q+NZ83
 98MY4jfVONrbUutKxEXnpFG6H/JoSDirVmxuOk7WChTV559mSqTn8AlqGZ3gBr0KgWZtj9
 FYCL5x6IQGqCUY2xH662o9SkyFd+xJjnGmfOzR1FI0g77YkAxRxNGgmr2k22wg==
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] cifs: double lock in cifs_reconnect_tcon()
In-Reply-To: <ZC6JEx4dvWUvgcwW@kili>
References: <ZC6JEx4dvWUvgcwW@kili>
Date: Thu, 06 Apr 2023 09:09:16 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dan Carpenter <error27@gmail.com> writes:

> This lock was supposed to be an unlock.
>
> Fixes: 6cc041e90c17 ("cifs: avoid races in parallel reconnects in smb1")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  fs/cifs/cifssmb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

