Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF819BB2D
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 06:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=R7XuxE3oi/q9z3oLv8BhaLQqBcYBlJAtHmLkYHvb678=; b=kkZq6c050h1Jp62LRSv/JiL2NL
	KlqH0eDd8vFrwtXE3KhkvYFcySajZ1/CywDOwMrSuOvVt1idM+XH3oIdAry3ak6qjU7/wPfZgMtvv
	qqo9Xz8vCJsPgxiRFIKen6KRw7ZIKNtLKWvUmH76MArlIpYkV9jn/07f2F5i2rsdbEmQNN8JStlhF
	hzvKnCvyhqM+xoKUP5gO3mBcPHga6f1du79kxdZoaFa0gcGA3q++qSoZqEYiZD7fR68OTTSvyKiXi
	zyDPB4i8HD6tCA5yUHLjsYzDl3VfsKlH1Ro8RaKeSd1BEhnnq9lRyFifKTVbF3bTwiMrCrgemFKIE
	Fu7bYvQA==;
Received: from localhost ([::1]:51142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJrjt-0033pC-WB; Thu, 02 Apr 2020 04:46:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35022) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJrjp-0033p5-4T
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 04:46:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a20so2591609edj.2
 for <samba-technical@lists.samba.org>; Wed, 01 Apr 2020 21:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aYTENypvmr7859oBmAc37btNbPEKQZuK0u9QYnrLsBQ=;
 b=hqmFM0vCAhk4epLrYD1mYkedBkbFOgDjpHepBCPlBcnXEhO6Vz1RhnLXu7db8pCRg3
 U9SWzKu/apCGe2CZ/hMcNR4k3eByA051gL4pqr7SLVQBhCABqagG7T4xZlojLK1H8K8w
 Zh1EKkCf5ubWDfmPH+pAjLG7Ws4waKX93Eqe8kY+3SLKWIesHwEXis/lbqzhXZtJR4uo
 AO9P6u2rOa/68zSL3uNvI0OiX/jPU1bYQObcAgPBmXc+XbaVMK1zLKsW89E1p0a2S79D
 rwBEeJ4oeqpGCH1GZy5YrLM81xI4JG+5iHlJe4kcsiB4sZUg6DgxOl/DE5mmirRGMpGI
 Zvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aYTENypvmr7859oBmAc37btNbPEKQZuK0u9QYnrLsBQ=;
 b=Oovr/8SoWkXeNw7F5tWvSUeaUPzrqWC2kIQ8KCq0NjbxzmUWwYw2H9UGiJ7zmkgHBw
 jnGJ5tsnnn8B4CP+t++9wCrGI9P7+RoeUNH2zf3SE9Kj2B+ZsxKu7f3vxwhMckWGeBD2
 ufmkHvya2adYC81wFKsleWhkW+dNUaJgGp/gol5J9KyRacGIfMDwNp0tiHmerOvre4aP
 GE1khsEnrJtlD1uPNJYvsixVAzEYA4UkKQdoOtDm6/pBNxC086z6JvElRmUGxzfgLlw/
 rEkgrCCzhwNqoU3mGeh0cpy3kwLxSLx4Z+JX+HfuvMjNTURTqiyFKT4av35V62VmvYNq
 8ksg==
X-Gm-Message-State: AGi0PuaDRf8KEBPsDWJElYyZl0DCyVdrgfiZNTMQPd5Aqka1Le1vM5kV
 LGCIFmS5gFzpjLeJSxtktIOG2dl6Y2yzTOdBdHUistnv
X-Google-Smtp-Source: APiQypIb2fwWACQoj404jAkWMusitCbyrZxoh+CpOqg47f0AoH13esYMJ6T4JIsjlGtQRsTlnaKc+MSovMDx/fceojc=
X-Received: by 2002:a17:906:eb93:: with SMTP id
 mh19mr1285425ejb.323.1585802756229; 
 Wed, 01 Apr 2020 21:45:56 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2020 10:15:44 +0530
Message-ID: <CAMO=cWeR9+qtgES6gW=Z-0WmvDwXVotFP=xHHeHG0KDq47a2LQ@mail.gmail.com>
Subject: Add torture test for AsyncStartPagePrinter method in MS-PAR
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
From: Rajendra Prajapat via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rajendra Prajapat <raj.code.pra@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone
This is Rajendra Prajapat. I have written a torture test for
MS-PAR(iremotewinspool.c) here
<https://gitlab.com/Rajpra786/samba/-/commit/17a2b16656af5997a8f8a5c56eef91a978e578ac>,
please verify and provide some suggestions.
Day before yesterday I have written a same test(same code) which passed all
pipelines on Gitlab but in that branch I had too many commits for a single
test and was't according to Samba guidelines so I created a new branch and
commit with same code. But for this commit  samba-admem
<https://gitlab.com/Rajpra786/samba/-/jobs/494918258> pipeline failed.
Previous pipeline which passed all pipelines:
https://gitlab.com/Rajpra786/samba/pipelines/131551644
New pipeline which failed at samba-admem:
https://gitlab.com/Rajpra786/samba/pipelines/131826696
Here is the error, at which the pipeline samba-admem failed
------------------------------------------------------------
--------------------------------------

[137(1000)/140 at 10m24s] samba.tests.auth_log_winbind(ad_member:local)
WARNING: The "lanman auth" option is deprecated
WARNING: The "lanman auth" option is deprecated
WARNING: The "server schannel" option is deprecated
INFO: Received PING message from server 788.1975188783 []
{"timestamp": "2020-04-01T20:09:31.216552+0000", "type":
"Authentication", "Authentication": {"version": {"major": 1, "minor":
2}, "eventId": 4624, "logonId": "eb69f769e71fc5fa", "logonType": 8,
"status": "NT_STATUS_OK", "localAddress": "unix:", "remoteAddress":
"unix:", "serviceDescription": "winbind", "authDescription":
"PAM_AUTH, ntlm_auth, 763", "clientDomain": "ADDOMAIN",
"clientAccount": "Administrator", "workstation": null,
"becameAccount": "", "becameDomain": "", "becameSid": null,
"mappedAccount": null, "mappedDomain": null, "netlogonComputer": null,
"netlogonTrustAccount": null, "netlogonNegotiateFlags": "0x00000000",
"netlogonSecureChannelType": 0, "netlogonTrustAccountSid": null,
"passwordType": "Plaintext", "duration": 221924}}
UNEXPECTED(error):
samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTestsWinbind.test_ntlm_auth(ad_member:local)
REASON: Exception: Exception: Traceback (most recent call last):
  File "bin/python/samba/tests/auth_log_winbind.py", line 253, in test_ntlm_auth
    self.check_domain_server_authentication(pipe, logon_id, "interactive")
  File "bin/python/samba/tests/auth_log_winbind.py", line 182, in
check_domain_server_authentication
    msg = json.loads(get_string(message))
  File "/usr/lib/python3.6/json/__init__.py", line 354, in loads
    return _default_decoder.decode(s)
  File "/usr/lib/python3.6/json/decoder.py", line 339, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
  File "/usr/lib/python3.6/json/decoder.py", line 357, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

FAILED (0 failures, 1 errors and 0 unexpected successes in 0 testsuites)

-------------------------------------------------------------------------------------------------------------------------------------------------------------

samba-admem: [test] failed 'make test FAIL_IMMEDIATELY=1
TESTS='--include-env=ad_member --include-env=ad_member_idmap_rid
--include-env=ad_member_idmap_ad --include-env=ad_member_rfc2307''
with status 2

Please give some suggestions on how can I remove this error, why this error
is occurring and also review this new test.

regards,
Rajendra Prajapat
