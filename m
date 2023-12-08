Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 019ED80ACA3
	for <lists+samba-technical@lfdr.de>; Fri,  8 Dec 2023 20:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=GGVDlKYmDU/1tbkuJjfbk6JvWhTSx4mOggBnQC67DWs=; b=1aR2RYXk2Muy4jKenSx+PpCZl4
	om/PL0Jvov+r23smOdW2GfpY1wL5b10AxaXRLKEjfar9YW0h2fP6zORlqXz80xIz7Uew86oOdLDp5
	aYrM6Y/0VUdAWKgh/2ZgHwjtgIFrzHxNufRzErL/psyuLnpEpksyEEUN2Z239s7wKIBDUFKz7yZbD
	l7cNE1qe+wtXJNbCNXlh+j5naQ3fI/ah3wz3atpL6jT9F35dyMYdxFp3kSoxA6teuYa0prLn+irl+
	NytkiIvrCkt/qe4mOLAf/rxdF4pOk5Q3usdfktgmzolyW1c9AWjGfCz5RewJBPwvvmb75RNaEevRt
	i8OJ3QyA==;
Received: from ip6-localhost ([::1]:41336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBgCW-005CH0-CV; Fri, 08 Dec 2023 19:07:52 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:37616) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBgCR-005CGr-UV
 for samba-technical@lists.samba.org; Fri, 08 Dec 2023 19:07:50 +0000
Message-ID: <ba42bcc91981af579d70a239f18ad810@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1702062465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GGVDlKYmDU/1tbkuJjfbk6JvWhTSx4mOggBnQC67DWs=;
 b=SCsPyga6QW+c94qKKTg4prmv5oNebVXk6sAxMn9/QTNPsUd06a0jc7w5O687huSNABgfvo
 MY4M1oMIdgplri1uwPDJ5AH3vEw0D9+gPAXEqtbODFN7HGLdNfU7dw02zkTSxofU1y2fu7
 tZFbxZYGNRAbxhaHx8bzGFoKCmZWl0OBiWESbOOE7ZwXlU+fp+2mkw0ek++Qg+usVPjI2u
 0Uq9i+VaLDEsXSdnQLp3Aux9UDIS06LxnffyCWj01/Gaz8ezVkyInAF4M9uztLQobyP3+J
 iARA3pVY/KBOqfwPeTxmKI5GKVXYGs5AJCj2wY+H+EwVoQhW6iP5G03FQ2QjGw==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1702062465; a=rsa-sha256; cv=none;
 b=bYEe2nb+uwsRywomyJ12+wLiJ0aVmr9lqT3JBkvXxYplV+4IKgeCcqM/Ew6YXnOJqyjT8Q
 Ajp1E6K6EZJEE14fpijoE7yi6SPR99lgEReNPYn0Dx8IBYwHXh3lY9TWy17WPvIJQMpGiD
 6G4NYF21d1a0UEO4ejzB6o4cV9bGbiJwDQlvU2cej/6bF8VsVrhxmXKrTE7LJGRMC5PsOq
 Ol3sJ1zWR0X7n+MJ0m5WXDKHoo8Txx+PzwtAdLA4V/WEFHl3tly8rnlteO5yBJBA/PZasx
 Axy1J6FjGy5qWbizb6Z/TnYDko0hi/UN7OXqnWbQuLVIi4mpLEIn+5fBd9tVeQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1702062465;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGVDlKYmDU/1tbkuJjfbk6JvWhTSx4mOggBnQC67DWs=;
 b=E5Lv4xvOv5W20rzc/mPOlwMf8+hSiR1ROiF4C7kUI7yuRu3bsLkyeQHQxBSedaikbdGTQa
 FlfWqQNyz7iAB7oboncr4Lls0f4ZOSZcVT4WbUhGtS0gFWq/ipqV5YsJQS/hEsUS8dzbT5
 A+IhFOKSxpMObMfloaa5RpLRZ4X/54F+ig2hnOvxTPDRosTOnWcaDhPvQ5RwMtZHJNQLzQ
 GyowM81/ryuS64WOs9rd9G+UQGQHXgwjEibs+oj5XsDQdNPO8xWhuHH9ttYXqK0SwNSl3b
 ln7CasC6yfHifUuV+puwQHtM718CvLvt6w4bTwDtYzzk5iMiXLmmo7kgc6B13Q==
To: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: Lease keys and hardlinked files
In-Reply-To: <2f21c53c-c374-40d3-b9ff-f2af8ec219cb@talpey.com>
References: <CAH2r5mtK-JQeH5gLoGjUS5sywfd-KTJhnF_Mf4c+KCoapMEPhQ@mail.gmail.com>
 <2f21c53c-c374-40d3-b9ff-f2af8ec219cb@talpey.com>
Date: Fri, 08 Dec 2023 16:07:41 -0300
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 Meetakshi Setiya <msetiya@microsoft.com>, meetakshisetiyaoss@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tom Talpey <tom@talpey.com> writes:

> On 12/8/2023 12:01 PM, Steve French wrote:
>> Following up on a question about hardlinks and caching data remotely,
>> I tried a simple experiment:
>> 
>> 1) ln /mnt/hardlink1 /mnt/hardlink2
>>     then
>> 2) echo "some data" >> /mnt/hardlink1
>>     then
>> 3) echo "more stuff" >> /mnt/hardlink2
>> 
>> I see the second open (ie the one to hardlink2) fail with
>> STATUS_INVALID_PARAMETER, presumably due to the lease key being reused
>> for the second open (for hardlink2) came from the first open (of
>
> Ok, so that is a client bug.

I guess Steve forgot to mention that the above only happens with the
patch applied.

