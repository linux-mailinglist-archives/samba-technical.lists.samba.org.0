Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51E97314
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2019 09:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=f8nWE45yul4R+hzfopIYqrWHk1UjYAoCtGQtWSXNahk=; b=PtUNz/oxl+4TwJmyMomTEgXyeR
	esKjNObfiqRF6h9wTaQocvCEchfNPP1Hq4w9pElDftrAwHU9Ri0WkNuAEYVgjOUeYNzsC8tqY9Is8
	FZwwkK/I4tBvYndt9jjbRdXFTDReMJp/HmJzMOriNHGKQq0a4U25cPdI0+KXXvmQJURYNXuB9TtOu
	P4iqM25uQjfj1iIl0L9qL+MZSkuRxBNxUIQqOzLtpOqUviM2plykcdK21NZf74HTGgB0KQtI5u00l
	QH2C3Z8mDeT8CZy5wioy+hyRv/DC61LBA5u2LEjLa+QivU6q1diK15DzFyWfZB4QHSfMEhjUN6K2P
	n+TRKfBw==;
Received: from localhost ([::1]:47426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0KmA-007Ksd-5p; Wed, 21 Aug 2019 07:11:22 +0000
Received: from mx1.redhat.com ([209.132.183.28]:58118) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i0Klx-007KsW-Rn
 for samba-technical@lists.samba.org; Wed, 21 Aug 2019 07:11:13 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC8C94FCC9
 for <samba-technical@lists.samba.org>; Wed, 21 Aug 2019 06:53:46 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id f5so916126plr.0
 for <samba-technical@lists.samba.org>; Tue, 20 Aug 2019 23:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:subject:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=f8nWE45yul4R+hzfopIYqrWHk1UjYAoCtGQtWSXNahk=;
 b=WMAKkMWAMS8jqb5udnkpJwuHOP2AHMckz4xxsB4mC7a1Umkt33NrL8NQEIU6WTfOz/
 BdDrLOvtvj5jSWz39rcnFn2DEkCxpMkQ/zbgapnw059irffmVLrLUOzDfwyu6KOte08s
 +ZwbXAXBwNi1kEMhawZAaFCAE2P/37Ag4irnF+HfsH86R1i9LB0Rm9JIypnY/xXsxV/0
 Km2wQvdIkbqXrYG8tlUK3WoptA/TrUQqvDVtvwGy93FaTDPOcPd21BjZrkWIZEMYYMll
 N0IYROUP6GtKUddrAfX/3BRIabPe2cxIbN0KhagOnu2U6g2c6Aq4PA6ZKoH8MrGy4hig
 ttVw==
X-Gm-Message-State: APjAAAW5tJ0GQhOAJUK4MX83U3abtGMXprUukAkWab/mEsLWuI34dO16
 sucesnv7vf6GFEwypNWMv/TtWK/xndMAtu9vUWZ7HuHjxnqIoS5zgkN+MK3hbBTbUSg0jTzfdeT
 F3V3m4dScyEexpe1DyyD3w1hTCSrj
X-Received: by 2002:a63:4404:: with SMTP id r4mr19459315pga.245.1566370426074; 
 Tue, 20 Aug 2019 23:53:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEJk965Y9SJPSXlKN8Q2csDli8H7MXwlmUhm0iwqbXG16u/e01Br5noLWDQMi+SfawkrnxDA==
X-Received: by 2002:a63:4404:: with SMTP id r4mr19459301pga.245.1566370425820; 
 Tue, 20 Aug 2019 23:53:45 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id f205sm38540813pfa.161.2019.08.20.23.53.44
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 23:53:45 -0700 (PDT)
Message-ID: <5d5cea79.1c69fb81.6fafd.7fec@mx.google.com>
X-Google-Original-From: Amit Kumar <anonymous>
To: samba-technical@lists.samba.org
Subject: Failing pipeline in print()
Date: Wed, 21 Aug 2019 12:23:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I created a Merge Request adding a try and except block
https://gitlab.com/samba-team/samba/merge_requests/710/diffs

But pipeline failing
https://gitlab.com/amitkuma/samba/-/jobs/276620958
Traceback (most recent call last):
  File "/tmp/samba-testbase/b21/samba-ad-dc-2/selftest/filter-subunit",
line 111, in <module>
    ret = subunithelper.parse_results(msg_ops, statistics, forgiving_stdin)
  File
"/tmp/samba-testbase/b21/samba-ad-dc-2/selftest/subunithelper.py", line
55, in parse_results
    msg_ops.output_msg(l)
  File
"/tmp/samba-testbase/b21/samba-ad-dc-2/selftest/subunithelper.py", line
299, in output_msg
    sys.stdout.write(msg)
BrokenPipeError: [Errno 32] Broken pipe

    def output_msg(self, msg):
        if self.output is None:
            sys.stdout.write(msg)
        else:
            self.output += msg

Is it pipeline will fail on print(), But join.py have some print()
statements, I will be investigating more on this.

Amit


