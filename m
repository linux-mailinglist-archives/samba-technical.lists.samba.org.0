Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B76539D736
	for <lists+samba-technical@lfdr.de>; Mon, 26 Aug 2019 22:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=TS6DaTC9EiDb4h/m7Xxl5lj2znGPqPWnMO1cyEL68UU=; b=F2ggyPY2GVXCGd5/l7H9j/N6b8
	IigmQiSyrfzRLJmyJO36JMnHBA7u35XN6rfZkr+KAa2k5fMW7cCj5V683VfcHJHf22H+fUB6w7ULA
	bF3nnBZeHobTulB0K+JhrgVmUAzYX8oempyl4ffqowwBTO/XTd32O/0lD8v2oG8YwLyghIWMqJ4lk
	wFvc8EXE25LCffG5o2J3DwVL0p7jARD7ZaBfLAbJ44p4e7eGcvkN9xQ56F8R5qzHotAO32kLRfvG7
	KoydHBTd4o8j6XhZvepfCdtnWkTnw97MHmOMVtbM3SfvFm4YgKH6TKlX+MwmhQh6LrAvcSs/m/GOM
	Kiq3h7lg==;
Received: from localhost ([::1]:41330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2LHU-008XpB-O4; Mon, 26 Aug 2019 20:08:00 +0000
Received: from mx1.redhat.com ([209.132.183.28]:59826) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i2LHP-008Xp4-Pu
 for samba-technical@lists.samba.org; Mon, 26 Aug 2019 20:07:58 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F001748FD;
 Mon, 26 Aug 2019 20:07:51 +0000 (UTC)
Received: from 10.4.128.1 (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E25AB196AE;
 Mon, 26 Aug 2019 20:07:50 +0000 (UTC)
Date: Mon, 26 Aug 2019 22:07:48 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: ldb test test_guid_indexed_v1_db fails on ppc64le
Message-ID: <20190826200748.GB2733638@10.4.128.1>
References: <20190826112911.GA2711905@10.4.128.1>
 <eaf9a97bd517e0b12b871fd5175759e86aa24c53.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eaf9a97bd517e0b12b871fd5175759e86aa24c53.camel@samba.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 26 Aug 2019 20:07:52 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: lslebodn@fedoraproject.org
Cc: Aaron Haslett <aaronhaslett@catalyst.net.nz>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On (27/08/19 06:27), Andrew Bartlett wrote:
>On Mon, 2019-08-26 at 13:29 +0200, Lukas Slebodnik via samba-technical
>wrote:
>> ehlo,
>> 
>> The repack unit test failed just only on ppc64le with ldb-2.0.5
>> Other architectures are ok
>> https://koji.fedoraproject.org/koji/taskinfo?taskID=37286196
>> 
>https://kojipkgs.fedoraproject.org//work/tasks/6219/37286219/build.log
>> 
>> BTW it would be good to suppress error messages
>> "MDB_INVALID: File is not an LMDB file".
>> I could see them also on x86_64
>> 
>
>Sadly LMDB is not portable across endian or word length boundaries. 
>
>The only way to fix this is to store a LE version of the LDB file and
>detect which to use.  We don't hit the word length issue because we
>lock this to 64 bit only so far.
>

IIUC:
* x86_64  is little endian and 64 bit
* ppc64le is little endian and 64 bit

So I do not see any difference and therefore I am confused here.
And there was not any failure on s390x which is big endian.

>Do you think you could have a go at that?
>

Is your comment related to the error message "MDB_INVALID: File is not an LMDB
file"  or to the failure in the test?

I am sorry but I am lost.
Moreover, the error " (1, 'Failure during prepare_write): Corrupt database -> Operations error')"
and my knowledge of ldb/tdb/lmdb is not sufficient for debugging
I already gave up after an hour. I am sorry I do not have days for that,

But I have an access to the ppc64le machine and I can help
with providing debug output with some trace messages if it helps.

LS

