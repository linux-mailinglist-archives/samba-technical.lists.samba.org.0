Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C0B239F
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2019 17:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ttBSnyQJ/XNT3QcKIenUWaLk+BD7cg0r9Z4/bvV2MpU=; b=mIVRHp7mp+SJ7IHrM1+mpDJjKB
	nZz+ZrxIZgvhY0lAa8YiDknERLhO9z0oUpAitJelJwd6Of8DkOiT/9pqfVPj9YdmpTEfubmacQgka
	EnPVpt8FH7hk+lFwrjmLg5rrpgXRrDS+tT8uFqNuWNf2IV05NNRN3gjG5Xa5KT3rxxtrBmOOuWK4N
	bZNYS0EddmMiV6KlQj1BMhoK+Te7G+0nfQmaVF2cFXitaF0gaghz7iDMNBq4X4k+SO1654962JHY/
	kwiEc92j+QsAQXj+d9nJkJNBc3tyDrcatK+NHWEo5jObCNrBh0USXkcQ3dZkfxVMk0HQyl+Fo5dlO
	x8fLFANg==;
Received: from localhost ([::1]:65444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8nkF-005N6J-IY; Fri, 13 Sep 2019 15:44:23 +0000
Received: from aserp2120.oracle.com ([141.146.126.78]:40266) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i8nk9-005N6B-Sm
 for samba-technical@lists.samba.org; Fri, 13 Sep 2019 15:44:21 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DDiEd3111500;
 Fri, 13 Sep 2019 13:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=ttBSnyQJ/XNT3QcKIenUWaLk+BD7cg0r9Z4/bvV2MpU=;
 b=MEiS5dj+D34PRHHYRJGbKpWDhZRhykrUuP9OsLV8pwyHnb04TTGs3wz4d1xrZNeqeHif
 FC/bhkueicDi+2DaztFfvi42boj1t6qSsFnE6WWgEYtr5LutwHKQPw7pAnsgOKlgsz5B
 ORf3g89WZ4KtjFOrv14gzVFpGk/0TrbR9Ik7aXjCc+TMvKjP5wikz+FcPpqAGpCqO7Ni
 52HFNbQq3yQjA0SDuTsbhOSQMtLiuxVEOd3/G1HFhkhSPjL8fkBfgebnBEQ88y7Ka+NA
 UiF75MGYunld0N8phXpB1a5pqz5UKfy0S88/QBcxRVlq7FJl5qCBnh4Ct58YzdyrjO+n LA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2uytd34u28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 13:46:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8DDhlBP158353;
 Fri, 13 Sep 2019 13:46:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2uytdmqef9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 13:46:45 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8DDkhn7012493;
 Fri, 13 Sep 2019 13:46:43 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Sep 2019 06:46:43 -0700
Date: Fri, 13 Sep 2019 16:46:34 +0300
To: kbuild@01.org, Steve French <stfrench@microsoft.com>
Subject: [cifs:for-next 24/31] fs/cifs/smb2ops.c:4056 smb2_decrypt_offload()
 error: we previously assumed 'mid' could be null (see line 4045)
Message-ID: <20190913134634.GR20699@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 kbuild-all@01.org, Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   5fc321fb644fc787710353be11129edadd313f3a
commit: a091c5f67c994d154e8faf95ab774644be2f4dd7 [24/31] smb3: allow parallelizing decryption of reads

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/cifs/smb2ops.c:4056 smb2_decrypt_offload() error: we previously assumed 'mid' could be null (see line 4045)

git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
git remote update cifs
git checkout a091c5f67c994d154e8faf95ab774644be2f4dd7
vim +/mid +4056 fs/cifs/smb2ops.c

a091c5f67c994d Steve French 2019-09-07  4030  static void smb2_decrypt_offload(struct work_struct *work)
a091c5f67c994d Steve French 2019-09-07  4031  {
a091c5f67c994d Steve French 2019-09-07  4032  	struct smb2_decrypt_work *dw = container_of(work,
a091c5f67c994d Steve French 2019-09-07  4033  				struct smb2_decrypt_work, decrypt);
a091c5f67c994d Steve French 2019-09-07  4034  	int i, rc;
a091c5f67c994d Steve French 2019-09-07  4035  	struct mid_q_entry *mid;
a091c5f67c994d Steve French 2019-09-07  4036  
a091c5f67c994d Steve French 2019-09-07  4037  	rc = decrypt_raw_data(dw->server, dw->buf, dw->server->vals->read_rsp_size,
a091c5f67c994d Steve French 2019-09-07  4038  			      dw->ppages, dw->npages, dw->len);
a091c5f67c994d Steve French 2019-09-07  4039  	if (rc) {
a091c5f67c994d Steve French 2019-09-07  4040  		cifs_dbg(VFS, "error decrypting rc=%d\n", rc);
a091c5f67c994d Steve French 2019-09-07  4041  		goto free_pages;
a091c5f67c994d Steve French 2019-09-07  4042  	}
a091c5f67c994d Steve French 2019-09-07  4043  
a091c5f67c994d Steve French 2019-09-07  4044  	mid = smb2_find_mid(dw->server, dw->buf);
a091c5f67c994d Steve French 2019-09-07 @4045  	if (mid == NULL)
a091c5f67c994d Steve French 2019-09-07  4046  		cifs_dbg(FYI, "mid not found\n");

Return here?

a091c5f67c994d Steve French 2019-09-07  4047  	else {
a091c5f67c994d Steve French 2019-09-07  4048  		mid->decrypted = true;
a091c5f67c994d Steve French 2019-09-07  4049  		rc = handle_read_data(dw->server, mid, dw->buf,
a091c5f67c994d Steve French 2019-09-07  4050  				      dw->server->vals->read_rsp_size,
a091c5f67c994d Steve French 2019-09-07  4051  				      dw->ppages, dw->npages, dw->len);
a091c5f67c994d Steve French 2019-09-07  4052  	}
a091c5f67c994d Steve French 2019-09-07  4053  
a091c5f67c994d Steve French 2019-09-07  4054  	dw->server->lstrp = jiffies;
a091c5f67c994d Steve French 2019-09-07  4055  
a091c5f67c994d Steve French 2019-09-07 @4056  	mid->callback(mid);
                                                ^^^^^^^^^^^^^
Potential NULL derference.

a091c5f67c994d Steve French 2019-09-07  4057  
a091c5f67c994d Steve French 2019-09-07  4058  	cifs_mid_q_entry_release(mid);
a091c5f67c994d Steve French 2019-09-07  4059  
a091c5f67c994d Steve French 2019-09-07  4060  free_pages:
a091c5f67c994d Steve French 2019-09-07  4061  	for (i = dw->npages-1; i >= 0; i--)
a091c5f67c994d Steve French 2019-09-07  4062  		put_page(dw->ppages[i]);
a091c5f67c994d Steve French 2019-09-07  4063  
a091c5f67c994d Steve French 2019-09-07  4064  	kfree(dw->ppages);
a091c5f67c994d Steve French 2019-09-07  4065  	cifs_small_buf_release(dw->buf);
a091c5f67c994d Steve French 2019-09-07  4066  }

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

