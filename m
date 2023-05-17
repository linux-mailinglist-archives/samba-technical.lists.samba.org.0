Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76405707368
	for <lists+samba-technical@lfdr.de>; Wed, 17 May 2023 22:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=k0U2Fq3ShImFNDxch8l92IXHWkElV47Y21SUnGd4+CU=; b=oq5eI8nvUZYGGdX5erHMwcx7m9
	dE1MkumGX2pk7moQFqel3JrfMosSDhldWc+C6z6Ih0w8cR7c4yXHDkN92myEN66CDmrVNZKppZ6J4
	VfmoBEJp2VA8vehusPZgyApVkwtiYYzLPkVNUEDJVANyxL4yZcSe2/aBvK3KVIC8u0U+VxxUmWjPa
	u3ECj11kD8A8UXMhAmO6p6+U/c17tAEKe/CNt5VL69p5EqxhU7tEoRzQZdEKyVV5PI4dhXa5XDBor
	1VXXEfVblHR+AaA6DUY0u4XECZOfsvbtMKlW7nKOjALnTNwqKXqLAoWbSsgc/5QlBZ0M40DxeBBye
	q41g6cjQ==;
Received: from ip6-localhost ([::1]:41446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pzOCU-00AYJ8-3B; Wed, 17 May 2023 20:56:46 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:44204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pzOCP-00AYIz-EK
 for samba-technical@lists.samba.org; Wed, 17 May 2023 20:56:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f27b65bbf9so1489589e87.0
 for <samba-technical@lists.samba.org>; Wed, 17 May 2023 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684357000; x=1686949000;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k0U2Fq3ShImFNDxch8l92IXHWkElV47Y21SUnGd4+CU=;
 b=Yzk1Lu3LkVgfYNXI6N1Kt6r2Gp3Ap/8v8KL59L3j/UMNKqPM5KN1oobHnSmB0DiOjl
 C/WI7gdqGBUj4ll73F1DHyDE4JedBISWo4VXyOtoeazGXaiggEpJWKdPMkHKZB088dCM
 MdaoQ5qYYJJzveNl9HOUT+hGh/1B+GGNqVHJiepm04ZCcgIpbY+6f4JPC1+DgyP9/DMw
 AnoEUQoWzfeyZzcxon/Z4t2RbE/4rolIeRvrtJ+sUT4xDQYTD4kAJMUjdqLJhEEpsyvs
 9LzYQa7iyflk/hdAcJrOpCgCFRXap7Ctz96ynJhGAvQbDY2ngSxF9JgpMiHEA3is3ohX
 41pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684357000; x=1686949000;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k0U2Fq3ShImFNDxch8l92IXHWkElV47Y21SUnGd4+CU=;
 b=FrMMSjDOe61FMzfg9IUG1Y/m4P2DKtuSrqF8JZt3iMpD/iPrv5e6qBOHH/iMA1eotr
 6hv6xAPuMy6re1mbCMo0qdDrpiTouCFvO1a+7RWFNRcE2XfKQ6hacHSoS8GDSRnBvOFb
 6ypPXMDPERf6RBh789TEta3B0TjqrvsHWPPt7eo6aEFnaPkRpamytNbRyihrIrxtJQq7
 7PKs3cjsDHkv5m9isq7fgynsS34PYxXEUuOpPm8PRQAHXXeq2SI1iaykZczKia2AdRmS
 z3W3sEihYFSNjFSMQDNu4bHE2hWFWHrqOBbODTcO+oi5y/yZNA9nuX4LEOUf6PLRtk1t
 i9jQ==
X-Gm-Message-State: AC+VfDzRw9M98aSUGXPMKyLt7k/pAbiEwx3a3G/J/+CSee6uDD2QsBB5
 wYifh21Y39qexU963bxBE1U0TC6SVziI9RLFFl4=
X-Google-Smtp-Source: ACHHUZ46RsRsQBP9bbTviIeir3zuRRLP3ziRt+oLhsGTqyQjZTFJ/11NrdFAZBhc4HCZoDS8pVU199FqQYlts+D2YMk=
X-Received: by 2002:ac2:4464:0:b0:4ee:dafa:cb00 with SMTP id
 y4-20020ac24464000000b004eedafacb00mr498061lfl.60.1684356999476; Wed, 17 May
 2023 13:56:39 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 17 May 2023 15:56:28 -0500
Message-ID: <CAH2r5mt=+=Xh+aNdfcFgB-yQuU_6NkUExpkYh5M4a9Axk4V9eQ@mail.gmail.com>
Subject: Linux client test automation improvements
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Migration of our Linux SMB3.1.1 client test automation (cifs.ko) to
the new host is showing progress, I have added additional tests, and
the tests run slightly faster overall.  Here is an example of a recent
run:

http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/7/builds/11

With another test group (Azure multichannel) I did see a few
intermittent test failures although those may be related to the test
system or network not cifs.ko (see
http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/1/builds/28
e.g.), still investigating those.

I will be rerunning the ksmbd and samba and samba POSIX test groups
today with the new setup (adding the additional tests which now work
with cifs.ko) and then finish by adding the main test group (which
crosses many server types)

-- 
Thanks,

Steve

