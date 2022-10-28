Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B47DB61159D
	for <lists+samba-technical@lfdr.de>; Fri, 28 Oct 2022 17:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=on03RcAPbbc6lFze8PkSICWQtMdPNDL0eAICUCOoGrQ=; b=J0mEwj9zOEtLwPOsbr3b2ud1bE
	lmmZmMp2paMdU+oolP42pyFGKQIEQwlUIRRnsDORZ/PS85vO80ZN5lkgh1ZCwTIckfRnxla7DB4WE
	Wx5FzUqWnPRJ4d0+VDjCEugo2aXRtHOVd5C2WleKC5U1tAWbZG5E9PBZlMUCRDVYNtQpjida5LVmr
	kLv3zhyI3e8mKS/cDIzmv1ti66U0SE9FTK7PqZOEn1AtztT7EyZPbbCve7vBelHgtj+edow7k0YFo
	7pmI38TZtkGa6PaANF2sj7UTJu8+RPNpjJSVMUBK7R7fn5NnwIILouqFun0pM+4922H1tCFV5C1gN
	8vaLQSMg==;
Received: from ip6-localhost ([::1]:59196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ooR2t-006vcO-MG; Fri, 28 Oct 2022 15:13:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63110) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ooR2p-006vcA-0v; Fri, 28 Oct 2022 15:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=on03RcAPbbc6lFze8PkSICWQtMdPNDL0eAICUCOoGrQ=; b=NjmMM0mZU/mVay2Aw53RR9kL//
 8dJvpgrfvwAJTbP+cWfymJcq7Kab6J/hBm+w2vDpwHLYFYFjNKyxKXngpYgH7YIpywe9Gybk5dH66
 J8ZIR9exasd2bJrqIr6O6pemY0Dx0dh/eRQnVb+UFJ2eblBvCG+KSOC6z8a2hmLZVV4cAtQVAeaC9
 3/MRZpHBLPCOmlTpl+i3Ucr5xEkLVItaMQFXCq1P4pfHQu4g7R8vJ9lUepKJ0J7Ot1q7JfyVOjfX+
 cf7NQv6hyA/AL1r5r5FjEz9K5R1BUCNsYzY2aQP5QlC4cMQMXKqNQ0+eOyipiXOAPaHZVoHGP+q8h
 ul3jxMBoN+Fb4FDY5xTtwxL1eCkzKpvliex+Wl5QpIAUbdhb+9pywiO1SslaOwQGt/Tnk+cvHkElW
 tdyyygl48SdygyLJ1lJdJTSD8sehDtYDI54DZLOs+dgNrfOK8k1z+b40/rlL1ho3Wr3AaXVow3wOJ
 MpTtgiIlWNx5XMXHo/kKIrVy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ooR2o-006DTj-EO; Fri, 28 Oct 2022 15:13:14 +0000
Message-ID: <83477fe5-83da-d635-0208-3ee881a023bf@samba.org>
Date: Fri, 28 Oct 2022 16:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Fwd: help - problem joining samba 4 AD to an existing Windows AD
 Domain Server
Content-Language: en-GB
To: samba-technical@lists.samba.org, samba@lists.samba.org
References: <CADZCxsu61TvCqf_hmbOLvM6hMC732T_V+y0ho=B+9F06nRHD7g@mail.gmail.com>
 <CADZCxsujN2adQi0Otv7c3bsRr-7qwfxLJtcS22joKjnCy-2d+w@mail.gmail.com>
 <CADZCxst9JQJajDWqAiX4AdzBaydkSRbin7Bes58MQYojeoLEvg@mail.gmail.com>
In-Reply-To: <CADZCxst9JQJajDWqAiX4AdzBaydkSRbin7Bes58MQYojeoLEvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Moving to samba mailing list:

On 28/10/2022 16:07, jmpatagonia via samba-technical wrote:
> Hello, we are using this document -->
> https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory
> Everything is alright, but one of the last command "samba-tool domain join
> cpern.edu.ar DC -k yes" starting working well but have and error and break:
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[43964/22106]
> linked_values[1522/1116]
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[44162/22106]
> linked_values[1525/1116]
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[44384/22106]
> linked_values[1525/1116]
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[44591/22106]
> linked_values[1525/1116]
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[44767/22106]
> linked_values[1525/1116]
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[44981/22106]
> linked_values[1525/1116]
> 
> Partition[DC=cpern,DC=edu,DC=ar] objects[45102/22106]
> linked_values[1533/1116]
> 
> *Done with always replicated NC (base, config, schema)*
> 
> *Replicating DC=DomainDnsZones,DC=cpern,DC=edu,DC=ar*
> 
> *Join failed - cleaning up*
> 
> Deleted CN=DC0,OU=Domain Controllers,DC=cpern,DC=edu,DC=ar
> 
> Deleted CN=NTDS Settings,CN=DC0,CN=Servers,CN=
> *Nombre-predeterminado-primer-sitio*
> ,CN=Sites,CN=Configuration,DC=cpern,DC=edu,DC=ar
> 
> Deleted
> CN=DC0,CN=Servers,CN=Nombre-predeterminado-primer-sitio,CN=Sites,CN=Configuration,DC=cpern,DC=edu,DC=ar
> 
> ERROR(runtime): uncaught exception - (8420, 'WERR_DS_CANT_FIND_EXPECTED_NC')
> 
> File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line 186,
> in _run
> 
> return self.run(*args, **kwargs)
> 
> File "/usr/lib/python3/dist-packages/samba/netcmd/domain.py", line 661, in
> run
> 
> join_DC(logger=logger, server=server, creds=creds, lp=lp, domain=domain,
> 
> File "/usr/lib/python3/dist-packages/samba/join.py", line 1559, in join_DC
> 
> ctx.do_join()
> 
> File "/usr/lib/python3/dist-packages/samba/join.py", line 1449, in do_join
> 
> ctx.join_replicate()
> 
> File "/usr/lib/python3/dist-packages/samba/join.py", line 1006, in
> join_replicate
> 
> repl.replicate(nc, source_dsa_invocation_id,
> 
> File "/usr/lib/python3/dist-packages/samba/drs_utils.py", line 338, in
> replicate
> 
> (level, ctr) = self.drs.DsGetNCChanges(self.drs_handle, req_level, req)
> 
> 
> Any idea ?
> 
> 
> Regards

