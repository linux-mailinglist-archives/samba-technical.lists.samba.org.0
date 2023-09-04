Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FA7914AB
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 11:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Qu5gocNp7Ie1SKO4h/OwB6ezAdFSbEBypmxDMY2g8VE=; b=zNWcZ4I7u64s3ZhoSfrp5gYBEB
	euF5DQJbrRT9dk6d3ENS+/3IYpvvp1VPzAKYCOvr7sAsZgIOt959vLe6LLmpCYkRqWtkUf9WNrYIq
	Ja34MujcGHDZAv47mYIB7KauHPqc4gikGg4tIjUwUhaskN2c4CJwbQrw0C3SBrwvpoCcFN2iXLQ+V
	cnJJ6RApzEdoTtPK4Q76KhMT6VZdRQOihy5pzkUKjRIQci0rd4WwPYE949YvAnqY3Prq3hfHggYpB
	77Oxg4IFpTwqrzNHxPPrZP0uG41jjEgUDW0K1/iQi0v/Yq02gsJrEiMCoLKy9icAXerT0+7qKEXQV
	ErHWRZAQ==;
Received: from ip6-localhost ([::1]:49962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd5nq-000JcB-BQ; Mon, 04 Sep 2023 09:23:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qd5nf-000Jc2-W1
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 09:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693819392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qu5gocNp7Ie1SKO4h/OwB6ezAdFSbEBypmxDMY2g8VE=;
 b=LYntD4lwcrjFZ6o1+pIxUJZ2AR9nEvaJbmbMZrOqrhdQCuCWd/xyhalB297WfPQsDi5udQ
 kP9jHfqRE8zbA+zSf9yxtYvEkb8ShUWg7/YqQMlZMsktLNJJukvjgeSxyws1uwcyW7Gs1q
 8jj1iRYzOQeV8bzzYamROLDpuoocSZc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693819392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qu5gocNp7Ie1SKO4h/OwB6ezAdFSbEBypmxDMY2g8VE=;
 b=LYntD4lwcrjFZ6o1+pIxUJZ2AR9nEvaJbmbMZrOqrhdQCuCWd/xyhalB297WfPQsDi5udQ
 kP9jHfqRE8zbA+zSf9yxtYvEkb8ShUWg7/YqQMlZMsktLNJJukvjgeSxyws1uwcyW7Gs1q
 8jj1iRYzOQeV8bzzYamROLDpuoocSZc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-_FXUeOX0PZuUYk7aKWWqmg-1; Mon, 04 Sep 2023 05:07:13 -0400
X-MC-Unique: _FXUeOX0PZuUYk7aKWWqmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7987381DCA9;
 Mon,  4 Sep 2023 09:07:12 +0000 (UTC)
Received: from magrathea.localnet (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43255C02996;
 Mon,  4 Sep 2023 09:07:11 +0000 (UTC)
To: samba-technical@lists.samba.org, slow@samba.org
Subject: `allow trusted domains = no` and `Unix Users`
Date: Mon, 04 Sep 2023 11:07:10 +0200
Message-ID: <2306152.ElGaqSPkdT@magrathea>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have a user who set `allow trusted domains = no` in his smb.conf. He also 
set `force user = localuser` on a share. However he is not able to connect to 
the local share:

[2023/07/27 12:31:43.434346,  3, pid=1019460, effective(0, 0), real(0, 0)] 
../../source3/lib/util_names.c:84(is_allowed_domain)
  is_allowed_domain: Not trusted domain 'UNIX USER'
[2023/07/27 12:31:43.434350,  3, pid=1019460, effective(0, 0), real(0, 0), 
class=auth] ../../source3/auth/auth_util.c:492(create_local_token)
  create_local_token: Authentication failed for user [cortexuser] from 
firewalled domain [UNIX USER]

The change was introduced by df5fe2d835169161d3930acf1e9c750dd2bc64b6

Is it by intention that local unix users fall into the "trusted domain" 
category or is this a bug?


Best regards


	Andreas



