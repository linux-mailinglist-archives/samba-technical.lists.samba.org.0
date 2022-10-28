Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B7611589
	for <lists+samba-technical@lfdr.de>; Fri, 28 Oct 2022 17:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PNVJgftYI3/Rmj0VpVFScdwRFwacVJwMxkXbN1ee4VQ=; b=uiqac7lPAobymdIzB8Fqo465UM
	ByGT3a+n0bard4mrSbqyRZkcT9L35Z/LgZLqgpVGe5C47TBzCZWiGiGgY/va14oFOpLjT8qOmXLx0
	iHK57s/g/TlCMQvN6k0kS3M0QyEDUInO41MuWBpLiKhcLSgWi6+YP6gwcKFNVKAGY/sifYdr1lVTK
	elIlwfHWjL6DNL5bJzUVAIssHeqIZie9de+xlQIQ41edbJrpFPDZ4dnQLfhyI2IDIdovxhl6t15q5
	EU2wvIyQEj7Ge5l+T4gAIDCXxg1pEdUyDJzMMtmU93bAEMX6b5TgBUcFlKY9ZjvvWf19hI55/ydsQ
	ic5rELeA==;
Received: from ip6-localhost ([::1]:19256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ooQy4-006vJN-2B; Fri, 28 Oct 2022 15:08:20 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42978) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ooQxx-006vJC-D9
 for samba-technical@lists.samba.org; Fri, 28 Oct 2022 15:08:17 +0000
Received: by mail-yb1-xb34.google.com with SMTP id j130so6423214ybj.9
 for <samba-technical@lists.samba.org>; Fri, 28 Oct 2022 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=roMSzDt0EvD+CoP8zpgtcmzeW1zkwqZ7tB61wfv8UnY=;
 b=fiWhYDxWeqL3QjeoSjX9x94iks4PzmpXMQS86qX4s/vYtq5hxpUd5LhBCWXNYoaxIg
 l2A3b1AoGJVXhmidiwfNt/Q71Bsg/7WLNWpE8yikgpW9oyjSLtqFjWFhQ1oh2VnjtbN9
 P53hdcOTdkawP2AdD0gPDofjiLhu5kPpT/jCWqGafToxx9YesMaL+6FiuXjBKK2QCw68
 hyn1jYvMpfAntaKDG2X0FZlJ5ykGS9gT/p3FEpefUkrik0F3takI7GXCbfpWON9ui+Ds
 HV1ENsWvET0MRRWbmvIRde562iab7fr8RlRMBnIxyTv9hni2bbDWjAIHOaUpXCO1NBUc
 5Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=roMSzDt0EvD+CoP8zpgtcmzeW1zkwqZ7tB61wfv8UnY=;
 b=aYUFO30qW+4ds2yKh/H0ctEMwRBEVAky0sR+MlW/CdCBc47twsIIgtyZ/rkLg/iuiB
 5DB3a3+pu9GynxGdll0jjINNH9rxAO5Yq7YRSMkmlVDPtllQ/uz3aI4gif96jI+t8pPn
 2SCl6ss4Ypy00vc01fiIkS52DDKjLr4bZac3MCUWUomwdgDQVuVuzUB0rymcpnq3eHb/
 /n2vI3/I3451gmSE1fUhqqhuTRZZdTjyjSLio47DYYp+ENPICcVVjqqabfgKNg2w8ieZ
 u2+btpAQq7Us/56Ai2OBk3DoDUi8Se8r7V8ed/gKFBp0SZ2KtOeztkG7pslfzB/6AViX
 8PAA==
X-Gm-Message-State: ACrzQf0yCJQbpyVG009Bo/S8rwKg94vjh/pUOpKqHc8rUTcm/a7L++EX
 pohLWubJ2qmgGKxUrLNSaScoXgzsdyGDH1LsVErPqlbL
X-Google-Smtp-Source: AMsMyM55a0MJ/h/EBIROXOAT2vX19OpAyG7m+v8hY5LoWzoALKHCsaYpE8YaP/sy6QTqxO+jp5WjtIoVqTweDEUlJHo=
X-Received: by 2002:a25:b805:0:b0:6bc:ff7:b3ee with SMTP id
 v5-20020a25b805000000b006bc0ff7b3eemr52860840ybj.616.1666969690082; Fri, 28
 Oct 2022 08:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <CADZCxsu61TvCqf_hmbOLvM6hMC732T_V+y0ho=B+9F06nRHD7g@mail.gmail.com>
 <CADZCxsujN2adQi0Otv7c3bsRr-7qwfxLJtcS22joKjnCy-2d+w@mail.gmail.com>
In-Reply-To: <CADZCxsujN2adQi0Otv7c3bsRr-7qwfxLJtcS22joKjnCy-2d+w@mail.gmail.com>
Date: Fri, 28 Oct 2022 12:07:58 -0300
Message-ID: <CADZCxst9JQJajDWqAiX4AdzBaydkSRbin7Bes58MQYojeoLEvg@mail.gmail.com>
Subject: Fwd: help - problem joining samba 4 AD to an existing Windows AD
 Domain Server
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
From: jmpatagonia via samba-technical <samba-technical@lists.samba.org>
Reply-To: jmpatagonia <jmpatagonia@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, we are using this document -->
https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory
Everything is alright, but one of the last command "samba-tool domain join
cpern.edu.ar DC -k yes" starting working well but have and error and break:

Partition[DC=cpern,DC=edu,DC=ar] objects[43964/22106]
linked_values[1522/1116]

Partition[DC=cpern,DC=edu,DC=ar] objects[44162/22106]
linked_values[1525/1116]

Partition[DC=cpern,DC=edu,DC=ar] objects[44384/22106]
linked_values[1525/1116]

Partition[DC=cpern,DC=edu,DC=ar] objects[44591/22106]
linked_values[1525/1116]

Partition[DC=cpern,DC=edu,DC=ar] objects[44767/22106]
linked_values[1525/1116]

Partition[DC=cpern,DC=edu,DC=ar] objects[44981/22106]
linked_values[1525/1116]

Partition[DC=cpern,DC=edu,DC=ar] objects[45102/22106]
linked_values[1533/1116]

*Done with always replicated NC (base, config, schema)*

*Replicating DC=DomainDnsZones,DC=cpern,DC=edu,DC=ar*

*Join failed - cleaning up*

Deleted CN=DC0,OU=Domain Controllers,DC=cpern,DC=edu,DC=ar

Deleted CN=NTDS Settings,CN=DC0,CN=Servers,CN=
*Nombre-predeterminado-primer-sitio*
,CN=Sites,CN=Configuration,DC=cpern,DC=edu,DC=ar

Deleted
CN=DC0,CN=Servers,CN=Nombre-predeterminado-primer-sitio,CN=Sites,CN=Configuration,DC=cpern,DC=edu,DC=ar

ERROR(runtime): uncaught exception - (8420, 'WERR_DS_CANT_FIND_EXPECTED_NC')

File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line 186,
in _run

return self.run(*args, **kwargs)

File "/usr/lib/python3/dist-packages/samba/netcmd/domain.py", line 661, in
run

join_DC(logger=logger, server=server, creds=creds, lp=lp, domain=domain,

File "/usr/lib/python3/dist-packages/samba/join.py", line 1559, in join_DC

ctx.do_join()

File "/usr/lib/python3/dist-packages/samba/join.py", line 1449, in do_join

ctx.join_replicate()

File "/usr/lib/python3/dist-packages/samba/join.py", line 1006, in
join_replicate

repl.replicate(nc, source_dsa_invocation_id,

File "/usr/lib/python3/dist-packages/samba/drs_utils.py", line 338, in
replicate

(level, ctr) = self.drs.DsGetNCChanges(self.drs_handle, req_level, req)


Any idea ?


Regards
