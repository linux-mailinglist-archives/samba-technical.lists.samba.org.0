Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C679B28023
	for <lists+samba-technical@lfdr.de>; Fri, 15 Aug 2025 14:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nZ2IGzRayrl8xt2kkonIr9cFYZvI/Yf/w4ZRxOOUMbM=; b=z51AwM0WLpyukgBcK1qNSWH4Nx
	JR30alX8rLxk84Xvv9dfUHsp0hjfgR8FMS00MoWidFd935VAcy9/51hS7xZtyCwX4A0rZ4DjBRg80
	/T9yCXkB4+R3w83JReTI/1NTYdJwd+NBZSX0Aln48Nd0mQS52alerFJNzyHmnKlrCJbP83WClnDYp
	16HuwMoH1PHm0dv3C/btjbhdVMd8P+MgidMZIRCD2NPdedk1SV4emZBpcd1g5VhoGVixkuhP1fIBz
	GMAVdCfk9wCXA/ZKFDC/gAUF5D53vxuXGTMikrk9qHmBteGON99h0KTN3e2reqcpxrfFhWkQzuR27
	v9c00hbw==;
Received: from ip6-localhost ([::1]:21536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umto9-00F55C-8n; Fri, 15 Aug 2025 12:45:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13070) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umto2-00F555-Fk
 for samba-technical@lists.samba.org; Fri, 15 Aug 2025 12:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=nZ2IGzRayrl8xt2kkonIr9cFYZvI/Yf/w4ZRxOOUMbM=; b=WuiCfmcI1BQDkRrZ1ZZfSmD/0c
 wm47jYkOJUIedi+vzbq2rbSjWc2ph3dtdLtJ3pQLK8lMXsd4sf4/AeOIxY9J4Jheu2YfDqHqcBmV3
 29B4PxGf09hdLOYkQ3fF0Q9jzdGHzCeL8lIAn2tlNxOnPTw6ZVaS4MIXWI5y/i4XnZhMlJCahN695
 G8I7H4Lf/ZoMX8evAhcZ5M6COqlySB49QtOpOcutF8lXEV0SGgdytOKB3ScFfuqJJVgbAv4BcqD0x
 xtgd4/CGo+47nettmQvnkepcGU2xKFzcOBDorx9jYlw7plVwipPs/MvVUagF27y8w0QzqCc+GpGd8
 7Yw+ub6LhbRWtrtGyIr11nOvbiu+W7FqnTNyCj3pVoJSOKJVOvwtZk2bIA/TGcKpSbfO1k1mR+Q34
 dkQeuRbGPhyHfgvptKc4N2rNoqrNY/JH0DqN/rb4E0s1QtJ4cdJiTsX07tR9bPhB+salluRiamLtJ
 lw/GjZyH3CP6hYencnMHY/LY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umto1-002zyG-24; Fri, 15 Aug 2025 12:45:13 +0000
Message-ID: <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
Date: Fri, 15 Aug 2025 14:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Pedro Falcato <pfalcato@suse.de>
References: <20250812164546.29238-1-metze@samba.org>
 <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
Content-Language: en-US
In-Reply-To: <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Pedro,

>> +void ksmbd_rdma_destroy(void)
>> +{
>>   	if (smb_direct_wq) {
>>   		destroy_workqueue(smb_direct_wq);
>>   		smb_direct_wq = NULL;
>> diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.h
>> index 0fb692c40e21..659ed668de2d 100644
>> --- a/fs/smb/server/transport_rdma.h
>> +++ b/fs/smb/server/transport_rdma.h
>> @@ -13,13 +13,15 @@
>>   
>>   #ifdef CONFIG_SMB_SERVER_SMBDIRECT
>>   int ksmbd_rdma_init(void);
>> +void ksmbd_rdma_stop_listening(void);
>>   void ksmbd_rdma_destroy(void);
>>   bool ksmbd_rdma_capable_netdev(struct net_device *netdev);
>>   void init_smbd_max_io_size(unsigned int sz);
>>   unsigned int get_smbd_max_read_write_size(void);
>>   #else
>>   static inline int ksmbd_rdma_init(void) { return 0; }
>> -static inline int ksmbd_rdma_destroy(void) { return 0; }
>> +static inline void ksmbd_rdma_stop_listening(void) { return };
>                                                       ^^ return; (nothing at all would be even better)
> This seems to have broken our internal linux-next builds.

Sorry for that!

Steve can you remove 'return' so that the line is this:
static inline void ksmbd_rdma_stop_listening(void) { }

Thanks!
metze

